package com.foro.demo.Controller;

import com.foro.demo.Entity.Usuario;
import com.foro.demo.Services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private JWTUtil jwtUtil;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Usuario usuario) {
        Optional<Usuario> usuarioOpt = usuarioService.obtenerUsuarioPorCorreo(usuario.getCorreoElectronico());

        if (usuarioOpt.isPresent() && usuarioOpt.get().getContrasena().equals(usuario.getContrasena())) {
            String token = jwtUtil.generarToken(usuarioOpt.get());
            return ResponseEntity.ok(new JWTResponse(token));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}

