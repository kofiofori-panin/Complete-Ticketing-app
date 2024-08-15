package util;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class PasswordUtils {

    // Hash a password
    public static String hashPassword(String plainPassword) {
        BCrypt.Hasher hasher = BCrypt.withDefaults();
        return hasher.hashToString(12, plainPassword.toCharArray());
    }

    // Check if the password matches the hashed password
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        BCrypt.Verifyer verifyer = BCrypt.verifyer();
        BCrypt.Result result = verifyer.verify(plainPassword.toCharArray(), hashedPassword);
        return result.verified;
    }
}
