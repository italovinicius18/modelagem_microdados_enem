import urllib.request
import zipfile
import os
from tqdm import tqdm
import polars as pl
from helper import ITENS_PROVA_SCHEMA, MICRODADOS_ENEM_SCHEMA


def baixar_e_descompactar_microdados(url, nome_arquivo_zip, pasta_destino="src/data"):
    """
    Baixa e descompacta os microdados do ENEM com barra de progresso usando urllib.

    Args:
        url (str): O URL para download do arquivo zip.
        nome_arquivo_zip (str): O nome do arquivo zip a ser salvo.
        pasta_destino (str, opcional): A pasta onde os dados serão extraídos.
                                       O padrão é "src/data".
    """
    try:
        # Cria a pasta de destino, se não existir
        if not os.path.exists(pasta_destino):
            os.makedirs(pasta_destino)
            print(f'Pasta "{pasta_destino}" criada.')

        # Baixa o arquivo com barra de progresso
        print(f"Baixando arquivo de: {url}")

        with (
            urllib.request.urlopen(url) as resposta,
            open(nome_arquivo_zip, "wb") as arquivo,
            tqdm(
                total=int(resposta.headers.get("Content-Length", 0)),
                unit="B",
                unit_scale=True,
                desc=nome_arquivo_zip,
            ) as pbar,
        ):
            while True:
                chunk = resposta.read(8192)
                if not chunk:
                    break
                arquivo.write(chunk)
                pbar.update(len(chunk))

        print(f"Arquivo salvo como: {nome_arquivo_zip}")

        # Descompacta o arquivo com barra de progresso
        print(f"Descompactando arquivo: {nome_arquivo_zip}")
        with zipfile.ZipFile(nome_arquivo_zip, "r") as zip_ref:
            lista_arquivos = zip_ref.namelist()
            with tqdm(
                total=len(lista_arquivos), desc="Descompactando", unit="file"
            ) as pbar:
                for arquivo in lista_arquivos:
                    zip_ref.extract(arquivo, pasta_destino)
                    pbar.update(1)
        print("Arquivo descompactado com sucesso!")

    except urllib.error.URLError as erro:
        print(f"Erro durante o download: {erro}")
    except zipfile.BadZipFile as erro:
        print(f"Erro ao descompactar o arquivo: {erro}")
    except Exception as erro:
        print(f"Ocorreu um erro: {erro}")


def converter_para_parquet(pasta_origem="src/data"):
    """
    Converte os arquivos CSV para o formato Parquet.

    Args:
        pasta_origem (str, opcional): A pasta onde os arquivos CSV estão localizados.
                                      O padrão é "src/data".
    """
    # Cria a pasta para os arquivos Parquet, se não existir
    os.makedirs(f"{pasta_origem}/parquet", exist_ok=True)

    try:
        itens_prova = pl.read_csv(
            f"{pasta_origem}/DADOS/ITENS_PROVA_2023.csv",
            has_header=True,
            separator=";",
            null_values=[""],
            ignore_errors=True,  # Ignora erros de parsing, útil para arquivos com problemas
            encoding="iso-8859-1",  # Codificação comum em arquivos legados
            schema_overrides=ITENS_PROVA_SCHEMA,  # Schema para garantir a tipagem correta
        )

        itens_prova.write_parquet(f"{pasta_origem}/parquet/ITENS_PROVA_2023.parquet")

        micro_enem = pl.read_csv(
            f"{pasta_origem}/DADOS/MICRODADOS_ENEM_2023.csv",
            has_header=True,
            separator=";",
            null_values=[""],
            ignore_errors=True,
            encoding="iso-8859-1",
            schema_overrides=MICRODADOS_ENEM_SCHEMA,
        )

        micro_enem.write_parquet(f"{pasta_origem}/parquet/MICRODADOS_ENEM_2023.parquet")

        print("Arquivos CSV convertidos para Parquet com sucesso!")

    except (
        pl.exceptions.ParseError
    ) as e:  # Captura erros específicos de parsing do Polars
        print(f"Erro ao converter para Parquet: Erro de parsing - {e}")
    except Exception as e:
        print(f"Erro ao converter para Parquet: {e}")


if __name__ == "__main__":
    url_microdados = "https://download.inep.gov.br/microdados/microdados_enem_2023.zip"
    nome_arquivo_zip = "microdados_enem_2023.zip"
    pasta_destino = "src/data"  # Define a pasta de destino

    baixar_e_descompactar_microdados(url_microdados, nome_arquivo_zip, pasta_destino)

    converter_para_parquet()
