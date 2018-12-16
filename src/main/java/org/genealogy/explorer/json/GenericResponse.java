package org.genealogy.explorer.json;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * 
 * A response object to hold the result and error message if any during
 * any API operations
 *
 */
@JsonInclude(Include.NON_NULL)
public class GenericResponse {
    
    private String result;
    private String message;
    
    

    public GenericResponse(String result, String message) {
        super();
        this.result = result;
        this.message = message;
    }
    
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
