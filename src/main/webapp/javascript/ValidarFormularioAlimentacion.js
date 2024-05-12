const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');
const OptionSelected = document.querySelectorAll('#formulario select');
const expresiones = {
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20  Digitos
    semana: /^[a-zA-Z0-9\s]*$/, // Decimales con punto  o Enteros
    dias: /^-?\d+([.,]\d+)?$/, // Decimales con punto  o Enteros
    fecha: /^(?=\s*\S)(\d{4}-\d{2}-\d{2})?$/, // Formato Fecha.
    promedio: /^-?\d+([.,]\d+)?$/ // Decimales con punto  o Enteros
}

const campos = {
    id_lote: false,
    semana: false,
    id_alimento: false,
    dia_1: false,
    dia_2: false,
    dia_3: false,
    dia_4: false,
    dia_5: false,
    dia_6: false,
    dia_7: false,
    fecha_I: false,
    fecha_F: false,
    promedio_semanal: false,
    promedio_diario: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_lote":
        case "id_alimento":    
            console.log("alimento")
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "semana":
            validarCampo(expresiones.semana, e.target, NombreCampo);
            break;
        case "dia_1":
        case "dia_2":
        case "dia_3":
        case "dia_4":
        case "dia_5":
        case "dia_6":
        case "dia_7":
            validarCampo(expresiones.dias, e.target, NombreCampo);
            break;
        case "fecha_I":
        case "fecha_F":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        case "promedio_semanal":
        case "promedio_diario":
            validarCampo(expresiones.promedio, e.target, NombreCampo);
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

inputs.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
    input.addEventListener('blur', ValidarForm);
});

OptionSelected.forEach((Option) => {
    // input.addEventListener('keyup', ValidarForm);
    Option.addEventListener('blur', ValidarForm);
});

function MiFuncion() {
  if (
        campos.id_lote &&
        campos.semana &&
        campos.dia_1 &&
        campos.dia_2 &&
        campos.dia_3 &&
        campos.dia_4 &&
        campos.dia_5 &&
        campos.dia_6 &&
        campos.dia_7 &&
        campos.fecha_I &&
        campos.fecha_F &&
        campos.promedio_semanal &&
        campos.promedio_diario && 
        campos.id_alimento
    ) {
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
        console.log("Entro a MiFuncion");

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


