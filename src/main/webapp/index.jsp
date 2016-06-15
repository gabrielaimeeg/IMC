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
    <form action="resultado">
        <div class="row col s4 offset-s4">
            <div class="input-field col s12">
                <input id="Peso" name="peso" step="any" type="number" min="1">
                <label for="Peso">Peso(kg)</label>
            </div>
        </div>

        <div class="row col s4 offset-s4">
            <div class="input-field col s12">
                <input id="Altura" name="altura" step="any" type="number" min="1">
                <label for="Altura">Altura(m)</label>
            </div>
        </div>

        <br><br>

        <div class="row col s4 offset-s4">
            <label>Sexo</label>
            <select name="sexo" class="browser-default">
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
<% System.out.println(request.getAttribute("resultado"));%>
<b>Resultado: ${resultado}</b><br>
<b>${informacao}</b>
</body>
</html>
