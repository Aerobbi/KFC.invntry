/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pertama;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;
/**
 *
 * @author User
 */
public class jaringan {
    private static Connection sambungan;
  
  public static Connection ambilKoneksi(){
      if (sambungan == null){
          MysqlDataSource dataKoneksi = new MysqlDataSource();
          dataKoneksi.setURL ("jdbc:mysql://localhost/kfcyahut");
          dataKoneksi.setUser ("root");
          dataKoneksi.setPassword("");
          try {
              sambungan = dataKoneksi.getConnection ();
          } catch (SQLException ex) {
              JOptionPane.showMessageDialog (null,"Error Koneksi :"+ ex.getMessage());
          }  
         }
          return sambungan;
  }
  
Connection koneksi() {
        throw new UnsupportedOperationException("Not supported yet.");
        }
}
