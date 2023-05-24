<%@page language="java" import="java.sql.*" %>
<%
   // Cria as variaveis e armazena as informações digitadas pelo usuario
   String vnome  = request.getParameter("txtNome");
   String vcpf =request.getParameter("txtCPF") ;
   String vtelefone = request.getParameter("txtTelefone");
   String vemail = request.getParameter("txtEmail");

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

   String sql = "INSERT INTO clientes (nome,cpf,telefone,email) values (?,?,?,?) " ;

   // Cria o statement para executar o camando no banco
   PreparedStatement stm = conexao.prepareStatement( sql );
   stm.setString( 1 , vnome ) ;
   stm.setString( 2 , vcpf ) ;
   stm.setString ( 3 , vtelefone) ;
   stm.setString ( 4 , vemail) ;

   stm.execute();

   conexao.close() ;
   stm.close() ;

   out.print("Dados gravados com sucesso!!!");
   out.print("<br><br>");
   out.print("<a href='validacao.html'>Voltar</a>");
%>