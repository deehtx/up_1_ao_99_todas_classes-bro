#Parte comum em todas quests de classes
automacro questClasse2_virarClasse2Inicio_bugada {
    FreeSkillPoints > 0
    timeout 30
    JobLevel = 50
    JobID $parametrosClasses{idC1}
    exclusive 1
    call {
        [
        log =============================================
        log = Estou pronto para virar claase2, porém    =
        log =     os pontos não estão distribuídos...   =
        log =            Vamos resolver isso!        =
        log =============================================
        ]
        do conf skillsAddAuto 1
        do conf skillsAddAuto_list $configsBuild{skillsClasse1}
        [
        log ================================================================
        log = Se isso estiver aparecendo repetidamente, a macro tem um bug
        log = Ou não foi definido skills para serem distribuídas nessa classe
        log ================================================================
        ]
    }
}

automacro questClasse2_inicio {
    JobLevel = 50
    JobID $parametrosClasses{idC1}
    ConfigKeyNot virarClasse2 true
    exclusive 1
    ConfigKey questc2_implementada true
    call {
        do conf -f virarClasse2 true
        do conf -f o_que_estou_fazendo virandoClasse2
    }
}

automacro questClasse2_jaSouClasse2 {
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}
    ConfigKey virarClasse2 true
    exclusive 1
    call {
        [
        log ===================
        log = Já sou classe 2 =
        log ===================
        ]
        do conf virarClasse2 none
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse2
        call atualizarBuild
    }
}

automacro questClasse2_jaSouClasse2NaoAutomatico {
    JobID $parametrosClasses{idC2} , $parametrosClasses{idC2Alt}
    ConfigKey esperarFazerQuest true
    exclusive 1
    call {
        [
        log =================================================
        log = Já sou classe 2, pois fiz a quest manualmente =
        log =================================================
        ]
        do conf esperarFazerQuest none
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse2
        call atualizarBuild
    }
}

 