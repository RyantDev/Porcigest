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
const inputsa = document.querySelectorAll('#formulario input ');
const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    cedula: /^(?=\s*\S)(\d{8}(\d{2})?)?$/, // Cedula de 0 a maximo 10 digitos.
    usuario: /^(?=\s*\S)(\D*(\d\D*){0,10})?$/, // Letras, numeros, guion y guion_bajo   
    nombre: /^(?=\s*\S)([^0-9]{1,40})?$/, // Letras y espacios, pueden llevar acentos.
    password: /^(?=\s*\S)(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, // 
    correo: /^(?=\s*\S)([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})?$/,
    telefono: /^(?=\s*\S)([^a-zA-Z]{1,10})?$/, // No Letras, solo numeros de 1 a 10. 
    tipo: /^(Administrador|Empleado|Super Admin)$/,
    fecha: /^(?=\s*\S)(\d{4}-\d{2}-\d{2})?$/, // Formato Fecha
    direccion: /^(?=\s*\S)([\s\S]*)?/
}

const campos = {
    cedula_usuario: false,
    nombre_usuario: false,
    usuario_clave: false,
    direccion_usuario: false,
    contrasena_clave: false,
    correo_usuario: false,
    telefono: false,
    tipo_rol: false,
    direccion: false,
    fecha_usuario: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "usuario_clave":
            validarCampo(expresiones.usuario, e.target, NombreCampo);
            break;
        case "cedula_usuario":
            validarCampo(expresiones.cedula, e.target, NombreCampo);
            break;
        case "correo_usuario":
            validarCampo(expresiones.correo, e.target, NombreCampo);
            break;
        case "direccion_usuario":
            validarCampo(expresiones.direccion, e.target, NombreCampo);
            break;
        case "nombre_usuario":
            validarCampo(expresiones.nombre, e.target, NombreCampo);
            break;
        case "contrasena_clave":
            validarCampo(expresiones.password, e.target, NombreCampo);
            break;
        case "tipo_rol":
            validarCampo(expresiones.tipo, e.target, NombreCampo);
            break;
        case "fecha_usuario":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        default:
            break;
    }
}

const validarCampo = (expre, inputsa, campo) => {
    console.log("Hola");
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

inputsa.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
    input.addEventListener('input', ValidarForm);
});

OptionSelected.forEach((Option) => {
    // input.addEventListener('keyup', ValidarForm);
    Option.addEventListener('input', ValidarForm);
});












