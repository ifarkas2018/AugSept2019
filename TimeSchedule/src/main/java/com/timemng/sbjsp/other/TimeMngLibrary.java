package com.timemng.sbjsp.other;

public class TimeMngLibrary {

	public TimeMngLibrary() {
		// TODO Auto-generated constructor stub
	}
	
	/*
	// addBacksl : calls the method that replaces every occurence of \ with \\\\ and replaces every occurence of ' with \\'
    public static String addBacksl(String descr){
        boolean isApostrophy = false; // is the character before which I need to add \\ a ' ( or a \ )
                
        // replacing every occurence of \ with \\\\
        descr = addBackslash(descr, isApostrophy);
        isApostrophy = true;
        // replacing every occurence of ' with \\'
        descr = addBackslash(descr, isApostrophy);
       
        return descr;
    }
    */
	

// addBackslash : adds 1 apostophe before the ' 
// used for adding the string which contains ' to the database
public static String addApostrophe(String str){
        String newStr = ""; // the string where I will add ' before the '
        String strToChar; // the substring of the string left to the '
        String strCharacter; // the string to be added instead of the ' 
        String strAfterChar; // the substring of the description after the '
        
        int prev_pos = -1; // position of the prevoius ' 
        int pos = 1; // position of the ' 
        int stringLen = str.length();
         
        strCharacter = "''";
        
        pos = str.indexOf("'", 0); // finds the position of the ' starting from the position = 0
        
        
        if (pos<0)
            newStr = str;
        
        // while the next ' is found in the string substitute it with ''  
        while (pos >= 0){
            newStr = "";
            prev_pos = pos-1;
            
            if (pos >= 0) {
                strToChar = str.substring(0, pos);
                strAfterChar = str.substring(pos+1, stringLen);
                newStr = newStr.concat(strToChar);
                newStr = newStr.concat(strCharacter);
                newStr = newStr.concat(strAfterChar);
                str = newStr;
                
                stringLen++; // I've added to the string '
                
                pos = str.indexOf("'", prev_pos+3); // finds the position of the ' starting from the position = prev_pos+3
            }
        }
        return newStr;
    }

// correctTime: if the strTime in a format h:mm PM adds 0 at the beginning AND if the strTime is in format hh:mmAM adds the space between hh:mm and AM
// AND the am ( or pm ) is substituted with AM ( or PM ).
public static String correctTime(String strTime){
	String newTime = strTime;
	
	// if the newTime in a format h:mm AM ( PM ) adds 0 at the beginning
	if (newTime.charAt(1) == ':') 
		newTime = "0" + newTime;
	
	// if the newTime is in format hh:mmAM adds the space between hh:mm and AM
	if (newTime.charAt(5) != ' ') 
		newTime = newTime.substring(0,5) + ' ' + newTime.substring(5); 
	
	// if the newTime contains pm substitute it with PM
	String endStr = newTime.substring(6);
	if (endStr.equals("pm"))
		newTime = newTime.substring(0,6) + "PM";
	
	// if the newTime contains am substitute it with AM
	if (endStr.equals("am"))
		newTime = newTime.substring(0,6) + "AM";
	return newTime;
}

}
