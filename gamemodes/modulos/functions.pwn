
stock IsLetter(letter[])
{
    for(new i, j = strlen(letter); i < j; i++)
    {
        if(!('A' <= letter[i] <= 'Z' || 'a' <= letter[i] <= 'z' || ' ' == letter[i]))
            return true; 
    }
    return false;
}

stock IsNumeric(number[])
{
	for (new c; c < strlen(number); c++)
    {
        if ('0' <= number[c] <= '9')
        	return true;
    }
	return false;
}

stock HaveUnder(input[])
{
	new len = strlen(input);
	for(new i = 0; i < len; i++)
	{
		if(input[i] == '_') 
			return true;
	}
	return false;
}
