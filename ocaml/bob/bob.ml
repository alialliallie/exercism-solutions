open Core.Std

let is_question remark =
    String.is_suffix remark "?"

let is_yelling remark =
    let has_alpha = String.exists ~f:Char.is_alpha remark in
        has_alpha && String.uppercase remark = remark

let is_silence remark =
    String.is_empty(String.strip remark)

let response_for remark =
    match remark with
    | _ when is_silence remark -> "Fine. Be that way!"
    | _ when is_yelling remark -> "Whoa, chill out!"
    | _ when is_question remark  -> "Sure."
    | _ -> "Whatever."
