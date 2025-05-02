/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.deltron.interfaces;

import com.deltron.models.User;
import java.util.Optional;

public interface UserDAO {
    boolean isAccountBlocked(String email);
    Optional<User> authenticateByEmail(String email, String password);
    void incrementFailedAttempts(String email);
    int getFailedAttempts(String email);
}
