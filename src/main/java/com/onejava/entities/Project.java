package com.onejava.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.PastOrPresent;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "project", indexes = {
        @Index(name = "idx_project_name", columnList = "name")
})
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @PastOrPresent
    @Column(name = "start_date")
    private LocalDate startDate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "manager_id", nullable = false)
    private ApplicationUser manager;

    @OneToMany(mappedBy = "project", cascade = {CascadeType.ALL, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
    private List<Task> tasks = new ArrayList<>();

}