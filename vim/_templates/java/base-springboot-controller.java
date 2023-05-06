{{_lang_util_:package}}

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class {{_expr_:substitute('{{_name_}}', '\w\+', '\u\0', '')}} {

	{{_cursor_}}
}
