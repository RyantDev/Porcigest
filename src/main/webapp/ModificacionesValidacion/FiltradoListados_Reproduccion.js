(function (document) {
    'use strict';
    var LightTableFilter = (function (Arr) {

        var _input;
        function _onInputEvent(e) {
            _input = e.target;
            var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
            Arr.forEach.call(tables, function (table) {
                Arr.forEach.call(table.tBodies, function (tbody) {
                    Arr.forEach.call(tbody.rows, _filter);
                });
            });
        }

        function _filter(row) {
            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
        }

        return {
            init: function () {
                var inputs = document.getElementsByClassName('light-table-filter');
                Arr.forEach.call(inputs, function (input) {
                    input.oninput = _onInputEvent;
                });
            }
        };
    })(Array.prototype);
    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            LightTableFilter.init();
        }
    });
})(document);

const table = document.getElementById("table");
const modal = document.getElementById("modal");
const inputs = document.querySelectorAll("input, select");
let count = 0;

window.addEventListener("click", (e) => {
    if (e.target.matches(".btn-warning")) {
        let data = e.target.parentElement.parentElement.children;
        fillData(data);
        modal.classList.toggle("translate");
     
    }

    if (e.target.matches(".btn-danger")) {
        modal.classList.toggle("translate");
        count = 0;
    }
});


const fillData = (data) => {
    for (let index of inputs) {
        console.log(data[count].textContent);
        if (index === inputs[0])  {
            continue;
        }
        index.value = data[count].textContent;
        count += 1;
    }
};


const formulario = document.getElementById('formulario');
const inputsa = document.querySelectorAll('#formulario input');
const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    NumeroC: /^(0*([1-9]|1[0-9]?|20))$/, // No mas de 20  Digitos
    id: /^[^a-zA-Z]{1,20}$/, //No mas de 20 Digitos.
    Fecha: /^(?=\s*\S)(\d{4}-\d{2}-\d{2})?$/, // Letras y espacios, pueden llevar acentos.
    Nacidos: /^(0*([1-9]|1[0-9]?|20))$/,
    descripcion: /^[\w\s.,!?'"()-]+$/ /// 1 a 70 digitos.
}

const campos = {
    numero_camada: true,
    fecha_parto: true,
    nacidos_vivos: true,
    nacidos_muertos: true,
    fecha_destete: true,
    observacion: true,
    id_padre: true,
    id_madre: true
}

let Validacion = false;  // Declarar Validacion como variable global


const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_madre":
        case "id_padre":
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "numero_camada":
            validarCampo(expresiones.NumeroC, e.target, NombreCampo);
            break;
        case "fecha_parto":
        case "fecha_destete":
            validarCampo(expresiones.Fecha, e.target, NombreCampo);
            break;
        case "nacidos_vivos":
        case "nacidos_muertos":
            validarCampo(expresiones.Nacidos, e.target, NombreCampo);
            break;
        case "observacion"   :
            validarCampo(expresiones.descripcion, e.target, NombreCampo);
            break;
        default:
            break;
    }
}

const validarCampo = (expre, inputsa, campo) => {
    if (expre.test(inputsa.value)) {
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
        document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
        document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
        campos[campo] = true;
    } else {
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
        document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
        document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
        campos[campo] = false;
    }
}


function  ValidarNumerosDeVivosYMuertos2(){
    console.log("Llae Funcio");
    var numeroCamadaInput = document.getElementById("numero_camada");
    var nacidosVivosInput = document.getElementById("nacidos_vivos");
    var nacidosMuertosInput = document.getElementById("nacidos_muertos");
    var numeroCamada = parseInt(numeroCamadaInput.value);
    var nacidosVivos = parseInt(nacidosVivosInput.value);
    var nacidosMuertos = parseInt(nacidosMuertosInput.value);

    console.log(numeroCamada);
    console.log(nacidosVivos);
    console.log(nacidosMuertos);

    var sumaNacidos = nacidosVivos + nacidosMuertos;

    if (numeroCamada === sumaNacidos) {
       Validacion = true;
    } else {
       Validacion = false;
    }
 
}

inputsa.forEach((input) => {
    input.addEventListener('blur', ValidarForm);
});


OptionSelected.forEach((Option) => {
    // input.addEventListener('keyup', ValidarForm);
    Option.addEventListener('blur', ValidarForm);
});




function MiFuncion() {
    console.log(Validacion);
    if (campos.numero_camada && campos.id_padre && campos.id_madre && campos.fecha_parto && campos.nacidos_vivos && campos.fecha_destete && campos.nacidos_muertos && Validacion) {
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
        setTimeout(function () {
            // Retrasa el envío del formulario después de 5 segundos (2000 milisegundos)
            document.getElementById('formulario').submit();
            formulario.reset();
        }, 2000);
        document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
            icono.classList.remove('formulario__grupo-correcto');
        });
        return false;
    } else {
        document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
        setTimeout(() => {
            document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        }, 2000);
        return false;
    }
}








