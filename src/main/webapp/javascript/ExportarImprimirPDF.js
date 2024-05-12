function exportToExcel(id) {
    // Temporalmente oculta los botones
    quitar_botones();
    const table = document.getElementById("tabla");
    const clonedTable = table.cloneNode(true);
    const buttonsCells = clonedTable.querySelectorAll('.button-cell');
    buttonsCells.forEach(cell => cell.remove());
    const ws = XLSX.utils.table_to_sheet(clonedTable);
    const wb = XLSX.utils.book_new();

    table_s(id, ws, wb);
    showButtons();
}
function table_s(id, ws, wb) {
    const tabla = {
        "cero": {name: "Alimentacion", filename: "tabla_Alimentacion.xlsx"},
        "uno": {name: "ContadorPorcinos", filename: "tabla_PorcinosReproduccion.xlsx"},
        "dos": {name: "PosiblesCrias", filename: "Tabla_Crias.xlsx"},
        "tres": {name: "CorralesDisp", filename: "tabla_CorralesDisponibles.xlsx"}
    };
    const selectedSheet = tabla[id];
    if (selectedSheet) {
        XLSX.utils.book_append_sheet(wb, ws, selectedSheet.name);
        XLSX.writeFile(wb, selectedSheet.filename);
    } else {
        console.log("ID de tabla no reconocido.");
    }
}

function generatePDF() {
    const table = document.getElementById("tabla");

    const {jsPDF} = window.jspdf;
    const pdf = new jsPDF();
    detectar_tabla(table);
}

function detectar_tabla(table) {
    const tabla_p = {
        "cero": {name: "Usuarios", filename: "tabla_usuarios.pdf"},
        "uno": {name: "Porcinos", filename: "tabla_Porcinos.pdf"},
        "dos": {name: "Porcinos_muertos", filename: "Tabla_Porcino_Muerto.pdf"},
        "tres": {name: "Lote_propietario", filename: "tabla_lote_propietario.pdf"},
        "cuatro": {name: "Corral", filename: "tabla_corral.pdf"},
        "cinco": {name: "Alimentacion", filename: "tabla_Alimentacion.pdf"},
        "seis": {name: "Lote", filename: "tabla_lote.pdf"},
        "siete": {name: "Etapa", filename: "tabla_etapa.pdf"}
    };

    const tablaselect = tabla_p[i];
    if (tablaselect) {
        pdf.text(tablaselect.name, 20, 10);
        pdf.autoTable({html: table});
        pdf.save(tablaselect.filename);
    } else {
        console.log("ID de tabla no reconocido.");
    }
}
// Función para ocultar los botones
function quitar_botones() {
    var buttons = document.querySelectorAll(".icon-button");
    buttons.forEach(function (button) {
        button.style.display = 'none';
    });
}

// Función para mostrar los botones
function showButtons() {
    var buttons = document.querySelectorAll(".icon-button");
    buttons.forEach(function (button) {
        button.style.display = 'inline-block';
    });
}


