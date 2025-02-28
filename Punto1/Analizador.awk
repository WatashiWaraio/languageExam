BEGIN {
    # Tokens 
    tokens["^[0-9]+\\.[0-9]+"] = "REAL"  
    tokens["^\\+\\+"] = "INCREMENTO"     
    tokens["^\\+"] = "SUMA"              
    tokens["^[0-9]+"] = "NUMERO"        
} 

{
    gsub(/^[ \t]+/, "", $0)  
    linea_original = $0
    error = 0
    
    
    while (length($0) > 0) {
        matched = 0
        for (pat in tokens) {
            if (match($0, pat)) {  
                valor = substr($0, RSTART, RLENGTH)
                print tokens[pat] " : " valor
                $0 = substr($0, RSTART + RLENGTH)
                matched = 1
                break  
            }
        }
        if (!matched) {
            $0 = substr($0, 2) 
        }
    }
}