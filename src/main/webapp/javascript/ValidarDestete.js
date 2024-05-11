const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');


const expresiones = {
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20  Digitos
    fecha: /^\d{4}-\d{2}-\d{2}$/,
    cantidad: /^.{2}$/,
    descripcion: /^[\w\s.,!?'"()-]+$/ // 
}

const campos = {
    id_porcino: false,
    preparacion_destete: false,
    problema_salud: false,
    alimentacion: false,
    necesidad_nutricional: false,
    fecha_destete: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_lote":
            console.log("Entro ID Lote");
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "fecha_Inicio_P":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        case "cantidad_porcino":
            validarCampo(expresiones.cantidad, e.target, NombreCampo);
            break;
        case "salud_porcinos":
        case "condicion_ambiental":
        case "tipo_dieta":
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

inputs.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
    input.addEventListener('blur', ValidarForm);
});

function MiFuncion() {
    if (campos.fecha_Inicio_P && campos.cantidad_porcino && campos.tipo_dieta && campos.condicion_ambiental && campos.salud_porcinos)   {
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
        setTimeout(function () {
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

