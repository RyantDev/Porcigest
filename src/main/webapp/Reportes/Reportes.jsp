<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enlace de Tabla</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2; /* Fondo gris claro */
                color: #333; /* Texto oscuro */
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            table {
                border-collapse: collapse;
                margin: 20px;
            }

            td {
                padding: 10px;
            }

            select {
                padding: 8px;
                width: 100%;
                box-sizing: border-box;
            }

            #linkTabla {
                display: block;
                padding: 10px;
                margin-top: 10px;
                color: #007BFF; /* Azul */
                text-decoration: none;
                text-align: center;
                background-color: #fff; /* Fondo blanco */
                border: 1px solid #007BFF; /* Borde azul */
                border-radius: 5px;
                cursor: pointer;
            }

            @media (min-width: 600px) {
                /* Aplicar estilos específicos para pantallas más grandes si es necesario */
                table {
                    width: 50%;
                }
            }
        </style>

        <script type="text/javascript">
            function cambiarEnlace() {
                var comboBoxOpciones = document.getElementById("opciones");
                var linkTabla = document.getElementById("linkTabla");

                var selectedOption = comboBoxOpciones.options[comboBoxOpciones.selectedIndex].value;

                // Verifica si la opción seleccionada es diferente a la actual
                if (selectedOption !== linkTabla.getAttribute("data-opcion")) {
                    // Cambia el enlace de la tabla
                    switch (selectedOption) {
                        case "opcion0":
                            console.log("Selecciona Una Opcion");
                            break;
                        case "opcion1":
                            linkTabla.href = "../Reportes/ListadoParaCria.jsp";
                            break;
                        case "opcion2":
                            linkTabla.href = "../Reportes/ListadoAlimentoConsumidoMes.jsp";
                            break;
                        case "opcion3":
                            linkTabla.href = "../Reportes/ListadosCorralesDisponibles.jsp";
                            break;
                        case "opcion4":
                            linkTabla.href = "../Reportes/ListadoContadorDePorPorcino.jsp";
                            break;
                        case "opcion5":
                            linkTabla.href = "../Reportes/ListadoDePorcinosPorLote.jsp";
                            break;
                    }

                    // Actualiza el atributo "data-opcion" con la opción seleccionada
                    linkTabla.setAttribute("data-opcion", selectedOption);
                }
            }
        </script>
    </head>
    <body>

        <table>
            <tr>
                <td>
                    <select id="opciones" onchange="cambiarEnlace()">
                        <option value="opcion0">Seleccione</option>
                        <option value="opcion1">Listado de Cerdas Disponibles Para Cria</option>
                        <option value="opcion2">Listado de Alimento Consumido</option>
                        <option value="opcion3">Listado de Corrales Disponibles</option>
                        <option value="opcion4">Listado de Reproducciones por cerdo</option>
                        <option value="opcion5">Listado de Porcinos por Lote</option>
                    </select>
                </td>
                <td>
                    <a id="linkTabla" data-opcion="" onclick="cambiarEnlace()">Buscar</a>
                </td>
            </tr>
        </table>
    </body>
</html>
