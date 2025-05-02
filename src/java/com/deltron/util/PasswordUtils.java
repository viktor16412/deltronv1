import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {
    
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }
    
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
    
    public static void main(String[] args) {
        // Ejemplo de uso:
        String originalPassword = "Password123";
        String hashed = hashPassword(originalPassword);
        System.out.println("Hash generado: " + hashed);
        
        // Verificación:
        boolean matched = checkPassword(originalPassword, hashed);
        System.out.println("Contraseña válida: " + matched);
    }
}