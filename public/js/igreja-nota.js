var select = document.getElementById("select-plano-contas");
var pesquisa = document.getElementById("conteudo-esconder");

function Ativar() {
    var selecionado = select.options[select.selectedIndex].value;

    if ( selecionado == "cemar" ) {
        pesquisa.style.display = "none";
    }
    else if ( selecionado == "caema" ) {
        pesquisa.style.display = "none";
    }
    else if ( selecionado == "movel" ) {
        pesquisa.style.display = "none";
    }
    else {
        pesquisa.style.display = "block";
    }
}
