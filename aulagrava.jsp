<%@page language="java" import="java.sql.*" %>
<%
   // Cria as variaveis e armazena as informações digitadas pelo usuario
   String vnome  = request.getParameter("txtNome");
   String vcpf = request.getParameter("txtCPF") ;
   String vemail = request.getParameter("txtEmail");
   String vtelefone = request.getParameter("txtTelefone");
   String vmensagem = request.getParameter("txtMensagem");

   // Variaveis para o banco de dados
   String banco    = "aula" ;
   String endereco = "jdbc:mysql://localhost:3306/" + banco ;
   String usuario  = "root";
   String senha    = "" ;

   String driver   = "com.mysql.jdbc.Driver" ;

   //Carregar o driver na memória
   Class.forName( driver ) ;

   //Cria a variavel para conectar com banco
   Connection conexao ;

   //Abrir a conexao com o banco
   conexao = DriverManager.getConnection(endereco, usuario, senha) ;

   String sql = "INSERT INTO contatos (nome,cpf,email,telefone,mensagem) values (?,?,?,?,?) " ;

   // Cria o statement para executar o camando no banco
   PreparedStatement stm = conexao.prepareStatement( sql );
   stm.setString( 1 , vnome ) ;
   stm.setString( 2 , vcpf ) ;
   stm.setString (3 , vemail) ;
   stm.setString (4 , vtelefone) ;
   stm.setString (5, vmensagem) ;


   stm.execute();

   conexao.close() ;
   stm.close() ;

   out.print("Dados gravados com sucesso!!!");
   out.print("<br><br>");
   out.print("<a href='Contato.html.html'>Voltar</a>");
%>