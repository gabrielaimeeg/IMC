import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resultado")
public class TesteServlet extends HttpServlet {
    private String valor(HttpServletRequest req, String param, String padrao) {

        String result = req.getParameter(param);
        if (result == null) {
            result = padrao;
        }

        return result;
    }

    private double toDouble(
            HttpServletRequest req,
            String param,
            String padrao) {

        return Double.parseDouble(valor(req, param, padrao));
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double peso = toDouble(req, "peso", "1.0");
        String sexo = valor(req, "sexo", "");
        double altura = toDouble(req, "altura", "1.0");

        double resultadoCalculo = calcular(peso, altura, sexo);
        resultadoCalculo = Math.round(resultadoCalculo * 100) / 100;


        if (resultadoCalculo != 0) {
            if (resultadoCalculo < 18.5) {
                req.setAttribute(
                        "resultado",
                        resultadoCalculo);
                req.setAttribute(
                        "informacao",
                        "Você está magro.");
            } else if (resultadoCalculo >= 18.5 && resultadoCalculo < 24.9) {
                req.setAttribute(
                        "resultado",
                        resultadoCalculo);
                req.setAttribute(
                        "informacao",
                        "Você está muito magro.");
            } else if (resultadoCalculo >= 25 && resultadoCalculo < 29.9) {
                req.setAttribute(
                        "resultado",
                        resultadoCalculo);
                req.setAttribute(
                        "informacao",
                        "Você está normal.");
            } else if (resultadoCalculo >= 30 && resultadoCalculo < 39.9) {
                req.setAttribute(
                        "resultado",
                        resultadoCalculo);
                req.setAttribute(
                        "informacao",
                        "Você está com obesidade.");
            } else if (resultadoCalculo > 40) {
                req.setAttribute(
                        "resultado",
                        resultadoCalculo);
                req.setAttribute(
                        "informacao",
                        "Você está com obesidade grave");
            }
        }
        System.out.println("R " + resultadoCalculo);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    public double calcular(double peso, double altura, String sexo) {

        double resultado = 0;

        if (altura != 0) {
            resultado = peso / (altura * altura);
        }


        return resultado;
    }
}