package dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
@Entity @Data
public class Markscard {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	int Standard;
	int science;
	int mathmetics;
	int English;
	int Socialscience;
	int Hindi;
	int Kannada;
 double percentage;
	String result;
	boolean status;
	}



