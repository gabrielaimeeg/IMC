<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
</head>
<body>
<nav>
    <div class="nav-wrapper #ff1744 red accent-3"><a class="brand-logo center"><span class="flow-text bold">Índice de Massa Corporal</span></a>
    </div>
</nav>
<br><br>

<div class="row">
    <form>
        <div class="row col s4 offset-s4">
            <div class="input-field col s12">
                <input id="Peso" name="Peso" type="number" min="1">
                <label for="Peso">Peso(kg)</label>
            </div>
        </div>

        <div class="row col s4 offset-s4">
            <div class="input-field col s12">
                <input id="Altura" name="Altura" type="number" min="1">
                <label for="Altura">Altura(m)</label>
            </div>
        </div>

        <br><br>

        <div class="row col s4 offset-s4">
            <label>Sexo</label>
            <select name="Sexo" class="browser-default">
                <option value="" disabled selected>Escolha o sexo:</option>
                <option value="1">Masculino</option>
                <option value="2">Feminino</option>
            </select>
        </div>

        <br><br>

        <div class="row center col s2 offset-s5">
            <button type="submit" class="waves-effect #ff1744 red accent-3 btn">Verificar</button>
        </div>
    </form>
</div>
<%
    String peso = request.getParameter("Peso");
    String altura = request.getParameter("Altura");
    String sexo = request.getParameter("Sexo");

    double pesoDouble = peso == null ? 0 : Double.parseDouble(peso);
    double alturaDouble = altura == null ? 0 : Double.parseDouble(altura);

    double resultado = 0;

    if (alturaDouble != 0) {
        resultado = pesoDouble / (alturaDouble * alturaDouble);
    }

    out.println("Resultado: " + resultado);

    if (resultado != 0) {
        if (resultado < 18.5) {
            out.println("Você está muito magro.");
        } else if (resultado >= 18.5 && resultado < 24.9) {
            out.println("Você está normal.");
        } else if (resultado >= 25 && resultado < 29.9) {
            out.println("Você está acima do peso.");
        } else if (resultado >= 30 && resultado < 39.9) {
            out.println("Você está com obesidade.");
        } else if (resultado > 40) {
            out.println("Você está com obesidade grave.");
        }
    }


%>
</body>
</html>
