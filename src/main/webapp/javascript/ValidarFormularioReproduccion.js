const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    NumeroC: /^(0*([1-9]|1[0-9]?|20))$/, // No mas de 20  Digitos
    id: /^[^a-zA-Z]{1,20}$/, //No mas de 20 Digitos.
    Fecha: /^(?=\s*\S)(\d{4}-\d{2}-\d{2})?$/, // Letras y espacios, pueden llevar acentos.
    Nacidos: /^(0*([1-9]|1[0-9]?|20))$/,
    descripcion: /^[\w\s.,!?'"()-]+$/ /// 1 a 70 digitos.
}

const campos = {
    numero_camada: false,
    fecha_parto: false,
    nacidos_vivos: false,
    nacidos_muertos: false,
    fecha_destete: false,
    observacion: false,
    id_padre: false,
    id_madre: false
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

const validarCampo = (expre, input, campo) => {
    if (expre.test(input.value)) {
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


function  ValidarNumerosDeVivosYMuertos(){
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


inputs.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
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


