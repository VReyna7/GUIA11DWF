package sv.edu.udb.www.springmvc.validations;

import org.springframework.context.MessageSource;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import sv.edu.udb.www.springmvc.entities.EditorialesEntity;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EditorialValidator implements Validator{
    private MessageSource messageSource;

    @Override
    public boolean supports(Class clazz) {
        return EditorialesEntity.class.equals(clazz); // clase del bean al que da soporte este validador
    }
    @Override
    public void validate(Object target, Errors errors) {
        Pattern patTelefono = Pattern.compile("[267][0-9]{3}-[0-9]{4}");
        EditorialesEntity editorial = (EditorialesEntity) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codigoEditorial",
                "field.codigoEditorial.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombreEditorial",
                "field.nombreEditorial.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contacto",
                "field.contacto.required");
        Matcher mat = patTelefono.matcher(editorial.getTelefono());
        if (!mat.matches()) {
            errors.rejectValue("telefono", "field.telefono.invalid");
        }
    }
}
