package com.petya136900.rcebot.tools;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.*;

/**
 * Annotation that provides information about argument's name.
 *
 * @since JavaFX 8.0
 */
@Retention(RUNTIME)
@Target(PARAMETER)
public @interface NamedArg {
    /**
     * The name of the annotated argument.
     * @return the name of the annotated argument
     */
    String value();

    /**
     * The default value of the annotated argument.
     * @return the default value of the annotated argument
     */
    String defaultValue() default "";
}