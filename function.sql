DELIMITER $$

 CREATE FUNCTION IMC (altura DOUBLE, peso DOUBLE) RETURNS VARCHAR(20) DETERMINISTIC 
 BEGIN 
	DECLARE	IMC VARCHAR(20); 
    SET imc = peso/(altura*altura);
    IF imc < 18.5 THEN
		SET IMC = "Magro";
	ELSEIF imc >= 18.6 AND imc < 25 THEN
		SET IMC = "Normal";
	ELSEIF imc >= 25.1 AND imc < 30 THEN
		SET IMC = "Obesidade I";
	ELSEIF imc >= 30.1 AND imc < 40 THEN
		SET IMC = "Obesidade II";
	ELSEIF imc > 40 THEN
		SET IMC = "Obesidade III";
	END IF;
    
    RETURN imc;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION validando_cpf (cpf CHAR(11)) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE soma INT;
    DECLARE indice INT;
    DECLARE digito_1 INT;
    DECLARE digito_2 INT;
    DECLARE cpf_validacao VARCHAR(11);
    
    
    SET digito_1 = SUBSTRING(cpf_validacao,1);
    SET digito_2 = SUBSTRING(cpf_validacao,1);
    
    
    
    SET cpf_validacao = TRIM(cpf);
    IF (cpf_validacao IN('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999', '12345678909'))THEN
		RETURN "Invalido";
	END IF;
    
    
	SET digito_1 = SUBSTRING(cpf_validacao, 10, 1);
    SET digito_2 = SUBSTRING(cpf_validacao, 11, 1);
    
	SET soma = 0;
	SET indice = 1;
        
		
	WHILE (indice <= 9) DO
		SET soma = soma + CAST(SUBSTRING(cpf_validacao, indice,1) AS UNSIGNED) * (11 - indice);
		SET indice = indice + 1;
	END WHILE;
	SET digito_1 = 11 -(soma % 11);
	IF digito_1 = 10 THEN
		SET digito_1 = 0;
	END IF;
        
    SET soma = 0;
    SET indice = 1;
        
    WHILE (indice <= 10) DO
		SET soma = soma + CAST(SUBSTRING(cpf_validacao, indice, 1) AS UNSIGNED) * (12 - indice);
        SET indice = indice + 1;
	END WHILE;
        
    SET digito_2 = 11 - (soma % 11);
    IF digito_2 = 10 THEN
		SET digito_2 = 0;
	END IF;
        
     IF (digito_1 = SUBSTRING(cpf_validacao, 10,1) AND digito_2 = SUBSTRING(cpf_validacao, 11)) THEN
		RETURN "Valido";
	ELSE
		RETURN "Invalido";
	END IF;
	
END;


        
    
    

