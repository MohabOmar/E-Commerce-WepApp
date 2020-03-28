package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/./pages/header.html");
    _jspx_dependants.add("/./pages/main.html");
    _jspx_dependants.add("/./pages/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>MAM STORE</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/e46fb9d55b.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head></head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <header>\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-4 col-sm-12 col-12\">\r\n");
      out.write("                        <div class=\"btn-group\">\r\n");
      out.write("                            <button class=\"btn border dropdown-toggle my-md-4 my-2 text-white\" \r\n");
      out.write("                                    data-toggle=\"dropdown\"\r\n");
      out.write("                                    aria-haspopup=\"true\"\r\n");
      out.write("                                    aria-expanded=\"false\">EGY\r\n");
      out.write("                            </button>\r\n");
      out.write("                            <div class=\"dropdown-menu\">\r\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">USD</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4 col-12 text-center\">\r\n");
      out.write("                        <h2 class=\"my-md-3 site-title text-white\">MAM</h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4 col-12 text-right\">\r\n");
      out.write("                        <p class=\"my-md-4 header-links\">\r\n");
      out.write("                            <a href=\"#\" class=\"px-2\">Sign In</a>\r\n");
      out.write("                            <a href=\"#\" class=\"px-2\">Create an Account</a>\r\n");
      out.write("                        </p></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"container-fluid p-0\">\r\n");
      out.write("                <nav class=\"navbar navbar-expand-lg navbar-light bg-white\">\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">Navbar</a>\r\n");
      out.write("                    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarTogglerDemo02\" aria-controls=\"navbarTogglerDemo02\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                        <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"collapse navbar-collapse\" id=\"navbarTogglerDemo02\">\r\n");
      out.write("                        <ul class=\"navbar-nav mr-auto mt-2 mt-lg-0\">\r\n");
      out.write("                            <li class=\"nav-item active\">\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#\">Home <span class=\"sr-only\">(current)</span></a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#\">Link</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"navbar-nav\">\r\n");
      out.write("                            <li class=\"nav-item border rounded-circle mx-2 basket-icon\">\r\n");
      out.write("                                <i class=\"fas fa-shopping-cart p-2\"></i>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <form class=\"form-inline my-2 my-lg-0\">\r\n");
      out.write("                            <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\">\r\n");
      out.write("                            <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Search</button>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </nav>\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head></head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <main>\r\n");
      out.write("            <div class=\"container-fluid p-0\" style=\"height: 200px;\">\r\n");
      out.write("                <div class=\"site-slider\">\r\n");
      out.write("                    <div class=\"slider-one\">\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <img src=\"./img/img01.png\" class=\"img-fluid\" alt=\"Banner1\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <img src=\"./img/img02.png\" class=\"img-fluid\" alt=\"Banner2\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <img src=\"./img/img01.png\" class=\"img-fluid\" alt=\"Banner3\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <img src=\"./img/img02.png\" class=\"img-fluid\" alt=\"Banner3\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"slider-btn\">\r\n");
      out.write("                        <span class=\"prev position-top\"><i class=\"fas fa-chevron-left\"></i></span>\r\n");
      out.write("                        <span class=\"next position-top right-0\"><i class=\"fas fa-chevron-right\"></i></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </main>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
      out.write(" \n");
      out.write("\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head></head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <footer>\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-4 col-sm-12 col-12\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4 col-12 text-center\">\r\n");
      out.write("                        <h2 class=\"my-md-3 site-title text-white\">Footer</h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </footer>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js\"></script>\n");
      out.write("        <script src=\"./js/main.js\"></script>  \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
