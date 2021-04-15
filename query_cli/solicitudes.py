import click
import os



@click.group()
def cli():
    pass

@cli.command()
@click.option("--data_file", "-d", type=click.Path(),
    help="Nombre del recurso csv")
@click.option("--p_value", "-p", type=str, metavar="<p-value>",
    help="Columna del p-value")
@click.option("--conditional", "-c", type=str,
    help="Condicional para el p-value")
@click.option("--fields", "-f", type=int,
    help="Opción que corresponde a las columnas que se van a seleccionar")
def select_growth_rates_and_p_values(data_file,p_value,conditional,fields):
    os.system("./src/select_growth_rates_and_p_values {} {} {} {}".format(data_file,p_value,conditional,fields))
    """
    hola
    """
    pass


@cli.command()
def funcion_2():
    pass
