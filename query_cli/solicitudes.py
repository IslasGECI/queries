import click
import os


@click.group()
def cli():
    pass


@cli.command(
    help="""
    Ejemplo:
    
    queries select-growth-rates-and-p-values -f 1 -d tests/data/cormorant_all_islets_growth_rates.csv -p p_value -c '"<= 0.1"'
    """
)
@click.option("--data_file", "-d", type=click.Path(), help="Nombre del recurso csv")
@click.option(
    "--p_value", "-p", type=str, metavar="<p_value>", help="Nombre de la columna del valor p"
)
@click.option(
    "--conditional",
    "-c",
    type=str,
    help="Es el filtro que le imponemos al valor p según la precisión buscada. Por ejemplo '<=0.1'",
)
@click.option(
    "--fields",
    "-f",
    type=int,
    help="""
    Son tres posibles valores:

    La opción 1 selecciona las columnas: Islet AS 'Archipelago/Island',Growth_rate AS 'Growth rate',

    La opción 2 selecciona las columnas: Species,Tasa_de_crecimiento AS 'Regional growth rate',

    La opción 3 selecciona las columnas: Species,Island AS 'Archipelago/Island',Latitude,Tasa_de_crecimiento AS 'Growth rate',
    """,
)
def select_growth_rates_and_p_values(data_file, p_value, conditional, fields):
    os.system(
        "./src/select_growth_rates_and_p_values {} {} {} {}".format(
            data_file, p_value, conditional, fields
        )
    )


@cli.command(
    help="""
    Ejemplo:
    queries cambia-formato-fecha --data_file tests/data/test_2019-2020.csv --column_name Fecha
    """
)
@click.option("--data_file", "-d", type=click.Path(), help="Nombre del recurso csv")
@click.option(
    "--column_name",
    "-c",
    type=str,
    help="Nombre de la columna que contiene la fecha a cambiar",
    default="Fecha",
)
def cambia_formato_fecha(data_file, column_name):
    os.system("./src/cambia_formato_fecha {} {}".format(data_file, column_name))
