package org.genealogy.explorer.utils;

/**
 * 
 * A custom exception class to handle all error scenarios in the application.
 *
 */
public class GenealogyException extends Exception {

    /**
     * 
     */
    private static final long serialVersionUID = -3046744454545830458L;

    public GenealogyException(Exception e) {
        super(e);
    }

    public GenealogyException(String errorMessage, Throwable e) {
        super(e);
        this.errorMessage = errorMessage;
        
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    /**
     * Place holder to hold the custom error message
     */
    private String errorMessage;

}
