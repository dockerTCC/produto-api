package multiversa.edu.produtoapi.model.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;


@Entity
@Table(name = "produto", schema = "teste")
@Data
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome", length = 1000)
    private String nome;
    private BigDecimal valor;

}
