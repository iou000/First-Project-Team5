package com.team5.test;

import org.testng.annotations.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTests {
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testConnection() {
        try (Connection con =
                     DriverManager.getConnection(
                             "jdbc:oracle:thin:@edudb_high?TNS_ADMIN=/Users/mac/Documents/wallet/Wallet_edudb",
                             "user01",
                             "xxxxxxAt21cc"
                     )) {
            System.out.println(con);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
