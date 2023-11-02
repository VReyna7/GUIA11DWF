package sv.edu.udb.www.springmvc.validations;

import sv.edu.udb.www.springmvc.entities.EditorialesEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class LibrosValidator implements Validator{
    @Override
    public boolean supports(Class clazz) {
        return EditorialesEntity.class.equals(clazz); // clase del bean al que da soporte este validador
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codigoLibro",
                "field.codigoLibro.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombreLibro",
                "field.nombreLibro.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "precio",
                "field.precio.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "existencias",
                "field.existencias.required");

    }
}
