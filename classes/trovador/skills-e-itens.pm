
automacro configurarConcentracao {
    SkillLevel AC_CONCENTRATION >= 1
    ConfigKeyNot useSelf_skill_0 AC_CONCENTRATION
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Concentração,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        #dicas de configuração do bloco enviadas por @MrAnderson
        do conf useSelf_skill_0 AC_CONCENTRATION
        do conf useSelf_skill_0_lvl 10
        do conf useSelf_skill_0_sp > 70
        do conf useSelf_skill_0_whenStatusInactive EFST_CONCENTRATION, EFST_POSTDELAY
        do conf useSelf_skill_0_disabled 0
        do conf useSelf_skill_0_notInTown 1
        do conf useSelf_skill_0_inLockOnly 1
        do conf useSelf_skill_0_notWhileSitting 1
    }
}

automacro configurarRajadaDeFlechas {
    SkillLevel AC_DOUBLE > 1
    ConfigKeyNot attackSkillSlot_0 AC_DOUBLE
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Rajada de Flechas,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        #dicas de configuração do bloco enviadas por @MrAnderson
        do conf attackSkillSlot_0 AC_DOUBLE
        do conf attackSkillSlot_0_sp >= 82
        do conf attackSkillSlot_0_dist none
        do conf attackSkillSlot_0_whenStatusActive EFST_CONCENTRATION
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_maxUses 1 #usar uma rajada por monstro, acho que fica legal assim
        do conf attackSkillSlot_0_disabled 0
    }
}

automacro configurarBuyAutoFlecha {
    ConfigKeyNot buyAuto_0 Flecha
    call {
        do conf buyAuto_0 Flecha
        do conf buyAuto_0_minAmount 25
        do conf buyAuto_0_maxAmount 5000
    }
}

automacro configurarEquiparFlechaAutomaticamente {
    ConfigKeyNot attackEquip_arrow Flecha
    call {
        do conf attackEquip_arrow Flecha
    }
}

automacro configurarUsarAljave {
    ConfigKeyNot useSelf_item_1 Aljave
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_1 Aljave
        do conf useSelf_item_1_inInventory  Flecha < 50
    }
}

