package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Entity
@Data
public class Teacher {
	@Id
	@GeneratedValue(generator = "empid")
	@SequenceGenerator(initialValue = 200, allocationSize = 1, name = "empid", sequenceName = "empid")
	int empid;
	String name;
	String subject;
	@Column(nullable = false, unique = true)
	String email;
	@Column(nullable = false, unique = true)
	long mobile;
	String password;
}
