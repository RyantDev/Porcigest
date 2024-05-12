const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input ');
const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    cedula: /^(?=\s*\S)(\d{8}(\d{2})?)?$/, // Cedula de 0 a maximo 10 digitos.
    usuario: /^(?=\s*\S)(\D*(\d\D*){0,10})?$/, // Letras, numeros, guion y guion_bajo   
    nombre: /^(?=\s*\S)([^0-9]{1,40})?$/, // Letras y espacios, pueden llevar acentos.
    password: /^(?=\s*\S)(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, // 
    correo: /^(?=\s*\S)([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})?$/,
    telefono: /^(?=\s*\S)([^a-zA-Z]{1,10})?$/, // No Letras, solo numeros de 1 a 10. 
    tipo: /^(Administrador|Empleado)$/,
    fecha: /^(?=\s*\S)(\d{4}-\d{2}-\d{2})?$/, // Formato Fecha
    direccion: /^(?=\s*\S)([\s\S]*)?/
}

const campos = {
    cedula_usuario: false,
    nombre_usuario: false,
    usuario_clave: false,
    direccion_usuario: false,
    contraseña_clave: false,
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
        case "contraseña_clave":
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
    if (campos.cedula_usuario && campos.nombre_usuario && campos.correo_usuario && campos.direccion_usuario && campos.usuario_clave  &&
            campos.tipo_rol && campos.fecha_usuario  && campos.contrasena_clave && campos.telefono) {
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
      
    } else {
        document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
        setTimeout(() => {
            document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        }, 2000);
        return false;
    }
}




