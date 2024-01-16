#!/bin/bash
source ShellBot.sh
api_bot="6476330993:AAEX_ALpyH0R_0uxX2Ff5cMeuaveqM2H1ro"
id_admin="5325383844"
ativos='/etc/bot/lista_ativos'
suspensos='/etc/bot/lista_suspensos'
ShellBot.init --token "$api_bot" --monitor --return map --flush
ShellBot.username
fun_menu() {
    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
        local env_msg
	env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴  </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>SELECCIONE UNA OPCIÓN A CONTINUACIÓN!</i>\n\n"
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} --text "$env_msg" \
            --reply_markup "$keyboard1" \
            --parse_mode html
        return 0
    }
    [[ -d /etc/bot/suspensos/${message_from_username} ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "🚫ESTAS SUSPENDIDO 🚫\n\nCONTACTA AL ADMINISTRADOR @NETCOLVIP")"
        return 0
    }
    if [[ "$(grep -w "${message_from_username}" $ativos | grep -wc 'revenda')" != '0' ]]; then
        local env_msg
        env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴  </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>SELECCIONE UNA OPCIÓN A CONTINUACIÓN!</i>\n\n"
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} --text "$env_msg" \
            --reply_markup "$keyboard2" \
            --parse_mode html
        return 0
    elif [[ "$(grep -w "${message_from_username}" $ativos | grep -wc 'subrevenda')" != '0' ]]; then
        local env_msg
        env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴🇨🇴     </b>\n"
	env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>/Telegram- @NETCOLVIP CRÉDITOS: @drowkid01 </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>SELECCIONE UNA OPCIÓN A CONTINUACIÓN!</i>\n\n"
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} --text "$env_msg" \
            --reply_markup "$keyboard3" \
            --parse_mode html
        return 0
    else
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e 🚫   ACCESO DENEGADO, HABLABLE AL ADMIN @NETCOLVIP  🚫)"
        return 0
    fi
}

fun_ajuda() {
    [[ ${message_chat_id[$id]} == "" ]] && {
        id_chatuser="${callback_query_message_chat_id[$id]}"
        id_name="${callback_query_from_username}"
    } || {
        id_chatuser="${message_chat_id[$id]}"
        id_name="${message_from_username}"
    }
    if [[ "$id_chatuser" = "$id_admin" ]]; then
        local env_msg
        env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴🇨🇴     </b>\n"
	env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>/Telegram- @NETCOLVIP CRÉDITOS: @drowkid01 </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>Comandos Disponibles</i>\n\n"
        env_msg+="[<b>01</b>] /menu = Muestra el menú\n"
        env_msg+="[<b>02</b>] /info = Muestra tu información\n"
        env_msg+="[<b>03</b>] /ajuda = Información de las opciones \n\n"
        env_msg+="⚠️ <i>Opciones Disponibles</i>\n\n"
        env_msg+="• <u>CREAR USUARIO</u> = \n\n"
        env_msg+="• <u>CREAR PRUEBA</u> = Crea una prueba ssh\n\n"
        env_msg+="• <u>ELIMINAR</u> = Eliminar usuario ssh\n\n"
        env_msg+="• <u>INFO USUARIOS</u> = Información de los usuarios\n\n"
        env_msg+="• <u>USUARIOS ONLINE</u> = Exibe Usuários onlines\n\n"
        env_msg+="• <u>INFO VPS</u> = Información del servidor\n\n"
        env_msg+="• <u>CAMBIAR CLAVE</u> = Cambiar la contraseña ssh\n\n"
        env_msg+="• <u>ALTERAR LIMITE</u> = Cambia el límite de ssh\n\n"
        env_msg+="• <u>CAMBIAR FECHA</u> = Cambia la fecha ssh\n\n"
        env_msg+="• <u>EXPIRADOS</u> = Eliminar usuarios caducados\n\n"
        env_msg+="• <u>BACKUP</u> = Crea una copia de seguridad con Ssh y revendedores \n\n"
        env_msg+="• <u>OPTIMIZAR</u> = Borra la memoria caché - ram\n\n"
        env_msg+="• <u>SPEEDTESTE</u> = Prueba de conexión\n\n"
        env_msg+="• <u>ARCHIVOS</u> = GUARDA ARCHIVOS\n\n"
        env_msg+="• <u>REVENTAS</u> = Gestionar REVENTAS\n\n"
        env_msg+="• <u>AUTOBACKUP</u> = lig/Des Backup automatico\n\n"
        env_msg+="• <u>RELATORIO</u> = Información sobre las REVENTAS\n\n"
        env_msg+="• <u>AJUDA</u> = Información de las opciones \n\n"
        ShellBot.sendMessage --chat_id $id_chatuser \
            --text "$(echo -e $env_msg)" \
            --parse_mode html
        return 0
    elif [[ -d /etc/bot/suspensos/$id_name ]]; then
        ShellBot.sendMessage --chat_id $id_chatuser \
            --text "$(echo -e "🚫 ESTAS SUSPENDIDO 🚫\n\nCONTACTA AL ADMINISTRADOR @NETCOLVIP @NETCOLVIP")"
        return 0
    elif [[ "$(grep -w "$id_name" $ativos | awk '{print $NF}')" == 'revenda' ]]; then
        local env_msg
        env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴🇨🇴     </b>\n"
	env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>/Telegram- @NETCOLVIP CRÉDITOS: @drowkid01 </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>Comandos disponibles</i>\n\n"
        env_msg+="[<b>01</b>] /menu = Muestra el menú\n"
        env_msg+="[<b>02</b>] /info = Muestra información\n"
        env_msg+="[<b>03</b>] /ayuda = Información ayuda\n\n"
        env_msg+="⚠️ <i>Opciones Disponibles</i>\n\n"
        env_msg+="• <u>CREAR USUARIO</u> = Crear usuarios ssh\n\n"
        env_msg+="• <u>CREAR DEMO</u> = Crear ssh demo\n\n"
        env_msg+="• <u>ELIMINAR USER</u> = Eliminar usuario ssh\n\n"
        env_msg+="• <u>USUARIO INFO</u> = Informacion del usuario\n\n"
        env_msg+="• <u>USUARIOS ONLINE</u> = Muestra usuarios en línea\n\n"
        env_msg+="• <u>CAMBIAR CONTRASEÑA</u> =Cambiar contraseña ssh\n\n"
        env_msg+="• <u>CAMBIAR LÍMITE</u> = Cambiar límite ssh\n\n"
        env_msg+="• <u>CAMBIAR FECHA</u> = Cambiar fecha ssh\n\n"
        env_msg+="• <u>CADUCADOS</u> = Eliminar expirados ssh\n\n"
        env_msg+="• <u>RESELLERS</u> = Administrar Resellers\n\n"
        env_msg+="• <u>REPORTE</u> = Reseller Informacion\n\n"
        env_msg+="• <u>AYUDA</u> = Option informacion\n\n"
        ShellBot.sendMessage --chat_id $id_chatuser \
            --text "$(echo -e $env_msg)" \
            --parse_mode html
        return 0
    elif [[ "$(grep -w "$id_name" $ativos | awk '{print $NF}')" == 'subrevenda' ]]; then
        local env_msg
        env_msg="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>----------♻️ ADMIN VPS ♻️----------</b>\n"
	env_msg+="<b>  # ⚡️⚡️ @NETCOLVIP 🇨🇴🇨🇴     </b>\n"
	env_msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        env_msg+="<b>/Telegram- @NETCOLVIP CRÉDITOS: @drowkid01 </b>\n"
	env_msg+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        env_msg+="⚠️ <i>Comandos disponibles</i>\n\n"
        env_msg+="[<b>01</b>] /menu = Muestra el menu\n"
        env_msg+="[<b>02</b>] /info = Muestra información\n"
        env_msg+="[<b>03</b>] /ayuda = Información de ayuda\n\n"
        env_msg+="⚠️ <i>Opciones Disponibles</i>\n\n"
        env_msg+="• <u>CREAR USUARIO</u> = Crear usuarios ssh\n\n"
        env_msg+="• <u>CREAR DEMO</u> = Crear ssh demo\n\n"
        env_msg+="• <u>ELIMINAR USER</u> = Eliminar usuario ssh\n\n"
        env_msg+="• <u>INFO USUARIOS</u> = User information\n\n"
        env_msg+="• <u>USUARIOS ONLINE</u> = Muestra usuarios en línea\n\n"
        env_msg+="• <u>CAMBIAR CONTRASEÑA</u> =Cambiar contraseña ssh\n\n"
        env_msg+="• <u>CAMBIAR LIMITE</u> = Cambiar límite ssh\n\n"
        env_msg+="• <u>CAMBIAR FECHA</u> = Cambiar fecha ssh\n\n"
        env_msg+="• <u>CADUCADOS</u> = Eliminar expirados ssh\n\n"
        env_msg+="• <u>AYUDA</u> = Option informacion\n\n"
        ShellBot.sendMessage --chat_id $id_chatuser \
            --text "$(echo -e $env_msg)" \
            --parse_mode html
        return 0
    else
        ShellBot.sendMessage --chat_id $id_chatuser \
            --text "$(echo -e 🚫   ACCESO DENEGADO, HABLABLE AL ADMIN @NETCOLVIP  🚫)"
        return 0
    fi
}

verifica_acesso() {
    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
        [[ "$(grep -wc ${message_from_username} $suspensos)" != '0' ]] || [[ "$(grep -wc ${message_from_username} $ativos)" == '0' ]] && {
            _erro="1"
            return 0
        }
    }
}

fun_adduser() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "👤 CREAR USUARIO 👤\n\nUsername:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫  ACCESO DENEGADO, HABLABLE AL ADMIN @NETCOLVIP   🚫"
        return 0
    }
}

criar_user() {
    IP=$(cat /etc/IP)
    newclient() {
        cp /etc/openvpn/client-common.txt ~/$1.ovpn
        echo "<ca>" >>~/$1.ovpn
        cat /etc/openvpn/easy-rsa/pki/ca.crt >>~/$1.ovpn
        echo "</ca>" >>~/$1.ovpn
        echo "<cert>" >>~/$1.ovpn
        cat /etc/openvpn/easy-rsa/pki/issued/$1.crt >>~/$1.ovpn
        echo "</cert>" >>~/$1.ovpn
        echo "<key>" >>~/$1.ovpn
        cat /etc/openvpn/easy-rsa/pki/private/$1.key >>~/$1.ovpn
        echo "</key>" >>~/$1.ovpn
        echo "<tls-auth>" >>~/$1.ovpn
        cat /etc/openvpn/ta.key >>~/$1.ovpn
        echo "</tls-auth>" >>~/$1.ovpn
    }
    file_user=$1
    usuario=$(sed -n '1 p' $file_user | cut -d' ' -f2)
    senha=$(sed -n '2 p' $file_user | cut -d' ' -f2)
    limite=$(sed -n '3 p' $file_user | cut -d' ' -f2)
    data=$(sed -n '4 p' $file_user | cut -d' ' -f2)
    validade=$(echo "$data" | awk -F'/' '{print $2FS$1FS$3}' | xargs -i date -d'{}' +%Y-%m-%d)
    if /usr/sbin/useradd -M -N -s /bin/false $usuario -e $validade; then
        (echo "${senha}";echo "${senha}") | passwd "${usuario}"
    else
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ ERROR CREANDO USUARIO ❌")" \
                --parse_mode html
        return 0
    fi
    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
        echo "$usuario:$senha:$info_data:$limite" >/etc/bot/revenda/${message_from_username}/usuarios/$usuario
        echo "$usuario:$senha:$info_data:$limite" >/etc/bot/info-users/$usuario
    }
    echo "$usuario $limite" >>/root/usuarios.db
    echo "$senha" >/etc/SSHPlus/senha/$usuario
    [[ -e "/etc/openvpn/server.conf" ]] && {
        cd /etc/openvpn/easy-rsa/
        ./easyrsa build-client-full $usuario nopass
        newclient "$usuario"
    }
    echo "user $usuario $validade $senha created"
}

fun_deluser() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "🗑 ELIMINAR USUARIO 🗑\n\nUsername:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫  ACCESO DENEGADO, HABLABLE AL ADMIN @NETCOLVIP   🚫"
        return 0
    }
}

fun_del_user() {
    usuario=$1
    [[ "${message_from_id[$id]}" = "$id_admin" ]] && {
        piduser=$(ps -u "$usuario" | grep sshd | cut -d? -f1)
        kill -9 $piduser >/dev/null 2>&1
        userdel --force "$usuario" 2>/dev/null
        grep -v ^$usuario[[:space:]] /root/usuarios.db >/tmp/ph
        cat /tmp/ph >/root/usuarios.db
        rm /etc/SSHPlus/senha/$usuario >/dev/null 2>&1
    } || {
        [[ ! -e /etc/bot/revenda/${message_from_username}/usuarios/$usuario ]] && {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ EL USUARIO NO EXISTE ❌")" \
                --parse_mode html
            _erro='1'
            return 0
        }
        piduser=$(ps -u "$usuario" | grep sshd | cut -d? -f1)
        kill -9 $piduser >/dev/null 2>&1
        userdel --force "$usuario" 2>/dev/null
        grep -v ^$usuario[[:space:]] /root/usuarios.db >/tmp/ph
        cat /tmp/ph >/root/usuarios.db
        rm /etc/SSHPlus/senha/$usuario >/dev/null 2>&1
        rm /etc/bot/revenda/${message_from_username}/usuarios/$usuario
        rm /etc/bot/info-users/$usuario
    }
    [[ -e /etc/SSHPlus/userteste/$usuario.sh ]] && rm /etc/SSHPlus/userteste/$usuario.sh
    [[ -e "/etc/openvpn/easy-rsa/pki/private/$usuario.key" ]] && {
        [[ -e /etc/debian_version ]] && GROUPNAME=nogroup
        cd /etc/openvpn/easy-rsa/
        ./easyrsa --batch revoke $usuario
        ./easyrsa gen-crl
        rm -rf pki/reqs/$usuario.req
        rm -rf pki/private/$usuario.key
        rm -rf pki/issued/$usuario.crt
        rm -rf /etc/openvpn/crl.pem
        cp /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem
        chown nobody:$GROUPNAME /etc/openvpn/crl.pem
        [[ -e $HOME/$usuario.ovpn ]] && rm $HOME/$usuario.ovpn >/dev/null 2>&1
    }
}

alterar_senha() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "🔐Change Password 🔐\n\nUsername:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫  ACCESO DENEGADO, HABLABLE AL ADMIN @NETCOLVIP   🚫"
        return 0
    }
}

alterar_senha_user() {
    usuario=$1
    senha=$2
    echo "$usuario:$senha" | chpasswd
    echo "$senha" >/etc/SSHPlus/senha/$usuario
    [[ -e /etc/bot/revenda/${message_from_username}/usuarios/$usuario ]] && {
        senha2=$(cat /etc/bot/revenda/${message_from_username}/usuarios/$usuario | awk -F : {'print $2'})
        sed -i "/$usuario/ s/\b$senha2\b/$senha/g" /etc/bot/revenda/${message_from_username}/usuarios/$usuario
        sed -i "/$usuario/ s/\b$senha2\b/$senha/g" /etc/bot/info-users/$usuario
    }
    [[ $(ps -u $usuario | grep sshd | wc -l) != '0' ]] && pkill -u $usuario >/dev/null 2>&1
}

alterar_limite() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "👥 Change Threshold 👥\n\nUsername:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

alterar_limite_user() {
    usuario=$1
    limite=$2
    database="/root/usuarios.db"
    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
        grep -v ^$usuario[[:space:]] /root/usuarios.db >/tmp/a
        mv /tmp/a /root/usuarios.db
        echo $usuario $limite >>/root/usuarios.db
        return 0
    }
    [[ -d /etc/bot/revenda/${message_from_username} ]] && {
        [[ ! -e /etc/bot/revenda/${message_from_username}/usuarios/$usuario ]] && {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ EL USUARIO NO EXISTE ❌")" \
                --parse_mode html
            _erro='1'
            return 0
        }
        _limTotal=$(grep -w 'LIMITE_REVENDA' /etc/bot/revenda/${message_from_username}/${message_from_username} | awk '{print $NF}')
        [[ "$limite" -gt "$_limTotal" ]] && {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ NO TIENES SUFICIENTE LÍMITE ❌\n\nCurrent Limit: $_limTotal ")" \
                --parse_mode html
            _erro='1'
            return 0
        }
        _limTotal=$(grep -w "${message_from_username}" $ativos | awk '{print $4}')
        fun_verif_limite_rev ${message_from_username}
        _limsomarev2=$(echo "$_result + $limite" | bc)
        echo "Total $_limsomarev2"
        [[ "$_limsomarev2" -gt "$_limTotal" ]] && {
            [[ "$_limTotal" == "$(($_limTotal - $_result))" ]] && _restant1='0' || _restant1=$(($_limTotal - $_result))
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ You don't have enough limit\n\nRemaining limit: $_restant1 ")" \
                --parse_mode html
            _erro='1'
            return 0
        }
        grep -v ^$usuario[[:space:]] /root/usuarios.db >/tmp/a
        mv /tmp/a /root/usuarios.db
        echo $usuario $limite >>/root/usuarios.db
        limite2=$(cat /etc/bot/revenda/${message_from_username}/usuarios/$usuario | awk -F : {'print $4'})
        sed -i "/\b$usuario\b/ s/\b$limite2\b/$limite/" /etc/bot/revenda/${message_from_username}/usuarios/$usuario
        sed -i "/\b$usuario\b/ s/\b$limite2\b/$limite/" /etc/bot/info-users/$usuario
    }
}

alterar_data() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "⏳ Change Date ⏳\n\nUsername:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

alterar_data_user() {
    usuario=$1
    inputdate=$2
    database="/root/usuarios.db"
    [[ "$(echo -e "$inputdate" | sed -e 's/[^/]//ig')" != '//' ]] && {
        udata=$(date "+%d/%m/%Y" -d "+$inputdate days")
        sysdate="$(echo "$udata" | awk -v FS=/ -v OFS=- '{print $3,$2,$1}')"
    } || {
        udata=$(echo -e "$inputdate")
        sysdate="$(echo -e "$inputdate" | awk -v FS=/ -v OFS=- '{print $3,$2,$1}')"
        today="$(date -d today +"%Y%m%d")"
        timemachine="$(date -d "$sysdate" +"%Y%m%d")"
        [ $today -ge $timemachine ] && {
            verify='1'
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "❌ Error! Invalid date")" \
                --parse_mode html
            _erro='1'
            return 0
        }
    }
    chage -E $sysdate $usuario
    [[ -e /etc/bot/revenda/${message_from_username}/usuarios/$usuario ]] && {
        data2=$(cat /etc/bot/info-users/$usuario | awk -F : {'print $3'})
        sed -i "s;$data2;$udata;" /etc/bot/info-users/$usuario
        echo $usuario $udata ${message_from_username}
        sed -i "s;$data2;$udata;" /etc/bot/revenda/${message_from_username}/usuarios/$usuario
    }
}

ver_users() {
    if [[ "${callback_query_from_id[$id]}" == "$id_admin" ]]; then
        arq_info=/tmp/$(echo $RANDOM)
        local info_users
        info_users='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n'
        info_users+='<b>USER INFORMATION</b>\n'
        info_users+='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n'
        info_users+='⚠️ Displays in the format below:\n\n'
        info_users+='<code>USER PASSWORD DATE LIMIT</code>\n'
        ShellBot.sendMessage --chat_id $id_admin \
            --text "$(echo -e $info_users)" \
            --parse_mode html
        fun_infu() {
            local info
            for user in $(cat /etc/passwd | awk -F : '$3 >= 1000 {print $1}' | grep -v nobody); do
                info='===========================\n'
                [[ -e /etc/SSHPlus/senha/$user ]] && senha=$(cat /etc/SSHPlus/senha/$user) || senha='Null'
                [[ $(grep -wc $user $HOME/usuarios.db) != '0' ]] && limite=$(grep -w $user $HOME/usuarios.db | cut -d' ' -f2) || limite='Null'
                datauser=$(chage -l $user | grep -i co | awk -F : '{print $2}')
                [[ $datauser = ' never' ]] && {
                    data="00/00/00"
                } || {
                    databr="$(date -d "$datauser" +"%Y%m%d")"
                    hoje="$(date -d today +"%Y%m%d")"
                    [[ $hoje -ge $databr ]] && {
                        data="Won"
                    } || {
                        dat="$(date -d"$datauser" '+%Y-%m-%d')"
                        data=$(echo -e "$((($(date -ud $dat +%s) - $(date -ud $(date +%Y-%m-%d) +%s)) / 86400)) DIAS")
                    }
                }
                info+="$user • $senha • $limite • $data"
                echo -e "$info"
            done
        }
        fun_infu >$arq_info
        while :; do
            ShellBot.sendMessage --chat_id $id_admin \
                --text "$(while read linha; do echo $linha; done < <(sed '1,30!d' $arq_info))" \
                --parse_mode html
            sed -i 1,30d $arq_info
            [[ $(cat $arq_info | wc -l) = '0' ]] && rm $arq_info && break
        done
    elif [[ "$(grep -wc "${callback_query_from_username}" $ativos)" != '0' ]]; then
        [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
            return 0
        }
        [[ $(ls /etc/bot/revenda/${callback_query_from_username}/usuarios | wc -l) == '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "You haven't created a user yet!"
            return 0
        }
        arq_info=/tmp/$(echo $RANDOM)
        local info_users
        info_users='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n'
        info_users+='<b>USER INFORMATION</b>\n'
        info_users+='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n'
        info_users+='⚠️ Displays in the format below:\n\n'
        info_users+='<code>USER PASSWORD DATE LIMIT</code>\n'
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e $info_users)" \
            --parse_mode html
        fun_infu() {
            local info
            for user in $(ls /etc/bot/revenda/${callback_query_from_username}/usuarios); do
                info='===========================\n'
                [[ -e /etc/SSHPlus/senha/$user ]] && senha=$(cat /etc/SSHPlus/senha/$user) || senha='Null'
                [[ $(grep -wc $user $HOME/usuarios.db) != '0' ]] && limite=$(grep -w $user $HOME/usuarios.db | cut -d' ' -f2) || limite='Null'
                datauser=$(chage -l $user | grep -i co | awk -F : '{print $2}')
                [[ $datauser = ' never' ]] && {
                    data="00/00/00"
                } || {
                    databr="$(date -d "$datauser" +"%Y%m%d")"
                    hoje="$(date -d today +"%Y%m%d")"
                    [[ $hoje -ge $databr ]] && {
                        data="Venceu"
                    } || {
                        dat="$(date -d"$datauser" '+%Y-%m-%d')"
                        data=$(echo -e "$((($(date -ud $dat +%s) - $(date -ud $(date +%Y-%m-%d) +%s)) / 86400)) DIAS")
                    }
                }
                info+="$user • $senha • $limite • $data"
                echo -e "$info"
            done
        }
        fun_infu >$arq_info
        while :; do
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "$(while read linha; do echo $linha; done < <(sed '1,30!d' $arq_info))" \
                --parse_mode html
            sed -i 1,30d $arq_info
            [[ $(cat $arq_info | wc -l) = '0' ]] && rm $arq_info && break
        done
    else
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "$(echo -e 🚫 ACCESS DENIED 🚫)"
        return 0
    fi
}

fun_drop() {
    port_dropbear=$(ps aux | grep dropbear | awk NR==1 | awk '{print $17;}')
    log=/var/log/auth.log
    loginsukses='Password auth succeeded'
    pids=$(ps ax | grep dropbear | grep " $port_dropbear" | awk -F" " '{print $1}')
    for pid in $pids; do
        pidlogs=$(grep $pid $log | grep "$loginsukses" | awk -F" " '{print $3}')
        i=0
        for pidend in $pidlogs; do
            let i=i+1
        done
        if [ $pidend ]; then
            login=$(grep $pid $log | grep "$pidend" | grep "$loginsukses")
            PID=$pid
            user=$(echo $login | awk -F" " '{print $10}' | sed -r "s/'/ /g")
            waktu=$(echo $login | awk -F" " '{print $2"-"$1,$3}')
            while [ ${#waktu} -lt 13 ]; do
                waktu=$waktu" "
            done
            while [ ${#user} -lt 16 ]; do
                user=$user" "
            done
            while [ ${#PID} -lt 8 ]; do
                PID=$PID" "
            done
            echo "$user $PID $waktu"
        fi
    done
}

monitor_ssh() {
    if [[ "${callback_query_from_id[$id]}" == "$id_admin" ]]; then
        database="/root/usuarios.db"
        cad_onli=/tmp/$(echo $RANDOM)
        local info_on
        info_on='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n'
        info_on+='<b>ONLINES USERS MONITOR</b>\n'
        info_on+='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n'
        info_on+='⚠️ Displays in the format below:\n\n'
        info_on+='<code>ONLIN USERE/TIME LIMIT\n</code>'
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e $info_on)" \
            --parse_mode html
        fun_online() {
            local info2
            for user in $(cat /etc/passwd | awk -F : '$3 >= 1000 {print $1}' | grep -v nobody); do
                [[ "$(grep -w $user $database)" != "0" ]] && lim="$(grep -w $user $database | cut -d' ' -f2)" || lim=0
                [[ $(netstat -nltp | grep 'dropbear' | wc -l) != '0' ]] && drop="$(fun_drop | grep "$user" | wc -l)" || drop=0
                [[ -e /etc/openvpn/openvpn-status.log ]] && ovp="$(cat /etc/openvpn/openvpn-status.log | grep -E ,"$user", | wc -l)" || ovp=0
                sqd="$(ps -u $user | grep sshd | wc -l)"
                _cont=$(($drop + $ovp))
                conex=$(($_cont + $sqd))
                [[ $conex -gt '0' ]] && {
                    timerr="$(ps -o etime $(ps -u $user | grep sshd | awk 'NR==1 {print $1}') | awk 'NR==2 {print $1}')"
                    info2+="===========================\n"
                    info2+="🟢 $user       $conex/$lim       ⏳$timerr\n"
                }
            done
            echo -e "$info2"
        }
        fun_online >$cad_onli
        [[ $(cat $cad_onli | wc -w) != '0' ]] && {
            while :; do
                ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                    --text "$(while read linha; do echo $linha; done < <(sed '1,30!d' $cad_onli))" \
                    --parse_mode html
                sed -i 1,30d $cad_onli
                [[ "$(cat $cad_onli | wc -l)" = '0' ]] && {
                    rm $cad_onli
                    break
                }
            done
        } || {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "No online users" \
                --parse_mode html
            return 0
        }
    elif [[ "$(grep -wc "${callback_query_from_username}" $ativos)" != '0' ]]; then
        [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️ ¡ESTÁS SUSPENDIDO! CONTACTE CON EL ADMINISTRADOR"
            return 0
        }
        [[ $(ls /etc/bot/revenda/${callback_query_from_username}/usuarios | wc -l) == '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "You haven't created a user yet!"
            return 0
        }
        database="/root/usuarios.db"
        cad_onli=/tmp/$(echo $RANDOM)
        local info_on
        info_on='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n'
        info_on+='<b>ONLINES USERS MONITOR</b>\n'
        info_on+='=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n'
        info_on+='⚠️ Displays in the format below:\n\n'
        info_on+='<code>ONLINE USER/TIME LIMIT\n</code>'
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e $info_on)" \
            --parse_mode html
        fun_online() {
            local info2
            for user in $(ls /etc/bot/revenda/${callback_query_from_username}/usuarios); do
                [[ "$(grep -w $user $database)" != "0" ]] && lim="$(grep -w $user $database | cut -d' ' -f2)" || lim=0
                [[ $(netstat -nltp | grep 'dropbear' | wc -l) != '0' ]] && drop="$(fun_drop | grep "$user" | wc -l)" || drop=0
                [[ -e /etc/openvpn/openvpn-status.log ]] && ovp="$(cat /etc/openvpn/openvpn-status.log | grep -E ,"$user", | wc -l)" || ovp=0
                sqd="$(ps -u $user | grep sshd | wc -l)"
                conex=$(($sqd + $ovp + $drop))
                [[ $conex -gt '0' ]] && {
                    timerr="$(ps -o etime $(ps -u $user | grep sshd | awk 'NR==1 {print $1}') | awk 'NR==2 {print $1}')"
                    info2+="------------------------------\n"
                    info2+="👤$user       $conex/$lim       ⏳$timerr\n"
                }
            done
            echo -e "$info2"
        }
        fun_online >$cad_onli
        [[ $(cat $cad_onli | wc -w) != '0' ]] && {
            while :; do
                ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                    --text "<code>$(while read linha; do echo $linha; done < <(sed '1,30!d' $cad_onli))</code>" \
                    --parse_mode html
                sed -i 1,30d $cad_onli
                [[ "$(cat $cad_onli | wc -l)" = '0' ]] && {
                    rm $cad_onli
                    break
                }
            done
        } || {
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "No online users" \
                --parse_mode html
            return 0
        }
    else
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "$(echo -e 🚫 ACESSO NEGADO 🚫)"
        return 0
    fi
}

fun_verif_user() {
    user=$1
    [[ -z "$user" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "Erro")" \
            --parse_mode html
        return 0
    }
    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
        [[ "$(awk -F : '$3 >= 1000 { print $1 }' /etc/passwd | grep -wc $user)" == '0' ]] && {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e ❌ Usuario $user não existe !)" \
                --parse_mode html
            _erro='1'
            return 0
        }
    }
    [[ -d /etc/bot/revenda/${message_from_username} ]] && {
        [[ ! -e /etc/bot/revenda/${message_from_username}/usuarios/$user ]] && {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e ❌ Usuario $user nao existe !)" \
                --parse_mode html
            _erro='1'
            return 0
        }
    }
}

fun_down() {
    [[ "${callback_query_from_id[$id]}" != "$id_admin" ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
    [[ ! -d /tmp/file ]] && mkdir /tmp/file
    ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
        --text "[1] - ADD FILE\n[2] - DELETE FILE\n\nEnter the option [1-2]:" \
        --reply_markup "$(ShellBot.ForceReply)"
}

infovps() {
    [[ "${callback_query_from_id[$id]}" != "$id_admin" ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e 🚫 ACCESS DENIED 🚫)"
        return 0
    }
    PTs='/tmp/prts'
    _ons=$(ps -x | grep sshd | grep -v root | grep priv | wc -l)
    [[ -e /etc/openvpn/openvpn-status.log ]] && _onop=$(grep -c "10.8.0" /etc/openvpn/openvpn-status.log) || _onop="0"
    [[ -e /etc/default/dropbear ]] && _drp=$(ps aux | grep dropbear | grep -v grep | wc -l) _ondrp=$(($_drp - 1)) || _ondrp="0"
    _on=$(($_ons + $_onop + $_ondrp))
    total=$(awk -F: '$3>=1000 {print $1}' /etc/passwd | grep -v nobody | wc -l)
    system=$(cat /etc/issue.net)
    uso=$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')
    cpucores=$(grep -c cpu[0-9] /proc/stat)
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    usoram=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
    total=$(cat -n /root/usuarios.db | tail -n 1 | awk '{print $1}')
    echo -e "SSH: $(grep 'Port' /etc/ssh/sshd_config | cut -d' ' -f2 | grep -v 'no' | xargs)" >$PTs
    [[ -e "/etc/stunnel/stunnel.conf" ]] && echo -e "SSL Tunel: $(netstat -nplt | grep 'stunnel' | awk {'print $4'} | cut -d: -f2 | xargs)" >>$PTs
    [[ -e "/etc/openvpn/server.conf" ]] && echo -e "Openvpn: $(netstat -nplt | grep 'openvpn' | awk {'print $4'} | cut -d: -f2 | xargs)" >>$PTs
    [[ "$(netstat -nplt | grep 'sslh' | wc -l)" != '0' ]] && echo -e "SSlh: $(netstat -nplt | grep 'sslh' | awk {'print $4'} | cut -d: -f2 | xargs)" >>$PTs
    [[ "$(netstat -nplt | grep 'squid' | wc -l)" != '0' ]] && echo -e "Squid: $(netstat -nplt | grep 'squid' | awk -F ":" {'print $4'} | xargs)" >>$PTs
    [[ "$(netstat -nltp | grep 'dropbear' | wc -l)" != '0' ]] && echo -e "DropBear: $(netstat -nplt | grep 'dropbear' | awk -F ":" {'print $4'} | xargs)" >>$PTs
    [[ "$(netstat -nplt | grep 'python' | wc -l)" != '0' ]] && echo -e "Proxy Socks: $(netstat -nplt | grep 'python' | awk {'print $4'} | cut -d: -f2 | xargs)" >>$PTs
    local info
    info="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
    info+="<b>SERVER INFORMATION</b>\n"
    info+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
    info+="<b>OPERATIONAL SYSTEM</b>\n"
    info+="$system\n\n"
    info+="<b>PROCESSOR</b>\n"
    info+="<b>Nuclei:</b> $cpucores\n"
    info+="<b>Use:</b> $uso\n\n"
    info+="<b>RAM MEMORY</b>\n"
    info+="<b>Total:</b> $ram1\n"
    info+="<b>Use:</b> $usoram\n\n"
    while read linha; do
        info+="<b>$(echo -e "$linha")</b>\n"
    done < <(cat $PTs)
    info+="\n<b>$total</b><i> USERS</i><b> $_on</b> <i>ONLINE</i>"
    ShellBot.sendMessage --chat_id $id_admin \
        --text "$(echo -e $info)" \
        --parse_mode html
    return 0
}

fun_download() {
    Opc=$1
    [[ -z "$Opc" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "❌error try again")"
        _erro='1'
        return 0
    }
    _file2=$2
    [[ -z "$_file2" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "❌error try again")"
        _erro='1'
        return 0
    }
    _DirArq=$(ls /etc/bot/arquivos)
    i=0
    unset _Pass
    while read _Arq; do
        i=$(expr $i + 1)
        _oP=$i
        [[ $i == [1-9] ]] && i=0$i && oP+=" 0$i"
        echo -e "[$i] - $_Arq"
        _Pass+="\n${_oP}:${_Arq}"
    done <<<"${_DirArq}"
    _file=$(echo -e "${_Pass}" | grep -E "\b$Opc\b" | cut -d: -f2)
    echo $_file2
    ShellBot.sendDocument --chat_id ${message_from_id[$id]} \
        --document "@/etc/bot/arquivos/$_file" \
        --caption "$(echo -e "✅ CREADO EXITOSAMENTE ✅\n\n♻️SSH Privada ♻️\n\n🔥⚡️⚡️ EL MEJOR SERVICIO ⚡️⚡️🔥\n======================\n=❌NO SPAM\n=❌NO DDOS\n=+❌NO HACKING\n=❌NO CARDING\n=❌NO TORRENT\n=❌NO MULTILOGIN\n=======================\n\n\nᗚ Username • ๛ <code>$(awk -F " " '/Nome/ {print $2}' $_file2)</code>\nᗚ Password • ๛ <code>$(awk -F " " '/Senha/ {print $2}' $_file2)</code>\nᗚ Limit • $(awk -F " " '/Limite/ {print $2}' $_file2)\nᗚ Expira • $(awk -F " " '/Validade/ {print $2}' $_file2)\n\n࿂ SSH •  22\n࿂ SSL •  443\n࿂ Squid  •  8080\n࿂ Dropbear •  80\n[-] ═───────◇───────═\n࿂ Badvpn •  7300\n [-] ═───────◇───────═\n›☬[•] SCRIPTS ═◇ DANSSH ◇═ [•]☬")" \
        --parse_mode html
    [[ -e "/root/$(awk -F " " '/Nome/ {print $2}' $_file2).ovpn" ]] && {
        ShellBot.sendDocument --chat_id ${message_from_id[$id]} \
            --document "@/root/$(awk -F " " '/Nome/ {print $2}' $_file2).ovpn"
    }
}

otimizer() {
    [[ "${callback_query_from_id[$id]}" != "$id_admin" ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e 🚫 ACCESS DENIED 🚫)"
        return 0
    }
    MEM1=$(free | awk '/Mem:/ {print int(100*$3/$2)}')
    ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
        --text "🧹 CLEANING THE SERVER'S CACHE"
    apt-get autoclean -y
    echo 3 >/proc/sys/vm/drop_caches
    sync && sysctl -w vm.drop_caches=3 1>/dev/null 2>/dev/null
    sysctl -w vm.drop_caches=0 1>/dev/null 2>/dev/null
    swapoff -a
    swapon -a
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    ram2=$(free -h | grep -i mem | awk {'print $3'})
    ram3=$(free -h | grep -i mem | awk {'print $4'})
    MEM2=$(free | awk '/Mem:/ {print int(100*$3/$2)}')
    res=$(expr $MEM1 - $MEM2)
    local sucess
    sucess="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
    sucess+="<b>SUCCESSFULLY OPTIMIZED !</b>\n"
    sucess+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
    sucess+="<i>Use anterior</i> $MEM1%\n\n"
    sucess+="<b>Total Ram Memory</b> $ram1\n"
    sucess+="<b>free</b> $ram3\n"
    sucess+="<b>In use</b> $ram2\n"
    sucess+="<i>Current use</i> $MEM2%\n\n"
    sucess+="<b>Esaving:</b> $res%"
    ShellBot.sendMessage --chat_id $id_admin \
        --text "$(echo -e $sucess)" \
        --parse_mode html
    return 0
}

speed_test() {
    [[ "${callback_query_from_id[$id]}" != "$id_admin" ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e 🚫 ACESSO NEGADO 🚫)"
        return 0
    }
    rm -rf $HOME/speed >/dev/null 2>&1
    ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
        --text "🚀 TESTING SERVER SPEED"
    speedtest --share >speed
    png=$(cat speed | sed -n '5 p' | awk -F : {'print $NF'})
    down=$(cat speed | sed -n '7 p' | awk -F : {'print $NF'})
    upl=$(cat speed | sed -n '9 p' | awk -F : {'print $NF'})
    lnk=$(cat speed | sed -n '10 p' | awk {'print $NF'})
    local msg
    msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
    msg+="<b>🚀 SERVER SPEED 🚀</b>\n"
    msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
    msg+="<b>PING/LATENCIA:</b>$png\n"
    msg+="<b>DOWNLOAD:</b>$down\n"
    msg+="<b>UPLOAD:</b>$upl\n"
    ShellBot.sendMessage --chat_id $id_admin \
        --text "$(echo -e $msg)" \
        --parse_mode html
    ShellBot.sendMessage --chat_id $id_admin \
        --text "$(echo -e $lnk)" \
        --parse_mode html
    rm -rf $HOME/speed >/dev/null 2>&1
    return 0
}

backup_users() {
    [[ "${callback_query_from_id[$id]}" != "$id_admin" ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "$(echo -e 🚫 ACESSO NEGADO 🚫)"
        return 0
    }
    rm /root/backup.vps 1>/dev/null 2>/dev/null
    ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
        --text "♻️ CREATING USERS BACKUP"
    tar cvf /root/backup.vps /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow /etc/bot /etc/SSHPlus/senha 1>/dev/null 2>/dev/null
    ShellBot.sendDocument --chat_id ${id_admin} \
        --document "@/root/backup.vps" \
        --caption "$(echo -e "♻️ USER BACKUP ♻️")"
    return 0
}

sobremim() {
    local msg
    msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
    msg+="<b>🤖 BOT USERS NETCOL 🤖</b>\n"
    msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
    msg+="<b>Soporte:</b> @NETCOLVIP\n\n"
    msg+="Fui creado con el proposito de brindar infomacion y herramientas para la gestion de VPN.\n\n"
    msg+="<b>Menu:</b> /menu\n"
    ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
        --text "$(echo -e $msg)" \
        --parse_mode html
    return 0
}

precios() {
    local msg
    msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
    msg+="<b>🤖 PRECIOS DEL BOT 🤖</b>\n"
    msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
    msg+="<b>Soporte:</b> @NETCOLVIP\n\n"
    msg+="♻️ 1 mes ♻️\n\n"
    msg+="1 conexión 5k\n"
    msg+="3 conexiones 6k\n"
    msg+="5 conexiones 8k\n"
    msg+="10 conexiones 15k\n"
    msg+="20 conexiones 25k\n"
    msg+="30 conexiones 30k\n"
    msg+="50 conexiones 35k\n\n"
    msg+="♻️ 2 meses ♻️\n\n"
    msg+="1 conexión 8k\n"
    msg+="3 conexiones 12k\n"
    msg+="5 conexiones 15k\n"
    msg+="10 conexiones 25k\n"
    msg+="20 conexiones 30k\n"
    msg+="30 conexiones 35k\n"
    msg+="50 conexiones 45k\n\n"
    msg+="♻️ 3 meses ♻️\n\n"
    msg+="1 conexión 10k\n"
    msg+="3 conexiones 15k\n"
    msg+="5 conexiones 20k\n"
    msg+="10 conexiones 30k\n"
    msg+="20 conexiones 35k\n"
    msg+="30 conexiones 40k\n"
    msg+="50 conexiones 50k\n\n"
    msg+="GRACIAS POR PREFERIRNOS"
    ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
        --text "$(echo -e $msg)" \
        --parse_mode html
    return 0
}
	
	
fun_add_teste() {
    if [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]]; then
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    elif [[ "${callback_query_from_id[$id]}" == "$id_admin" ]]; then
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "👤 CREATE TEST 👤\n\nHow many hours should EX last: 1:" \
            --reply_markup "$(ShellBot.ForceReply)"
    elif [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]]; then
        _limTotal=$(grep -w "${callback_query_from_username}" $ativos | awk '{print $4}')
        fun_verif_limite_rev ${callback_query_from_username}
        _limsomarev2=$(echo "$_result + 1" | bc)
        [[ "$_limsomarev2" -gt "$_limTotal" ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "❌YOU HAVE NO AVAILABLE LIMIT!"
            return 0
        } || {
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "👤 CREATE TEST 👤\n\nHow many hours should EX last: 1:" \
                --reply_markup "$(ShellBot.ForceReply)"
        }
    else
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    fi
}

fun_teste() {
    usuario=$(echo netcol$((RANDOM % +500)))
    senha='1234'
    limite='1'
    t_time=$1
    ex_date=$(date '+%d/%m/%C%y' -d " +2 days")
    tuserdate=$(date '+%C%y/%m/%d' -d " +2 days")
    [[ -z $t_time ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "❌ error try again")" \
            --parse_mode html
        return 0
        _erro='1'
    }
    /usr/sbin/useradd -M -N -s /bin/false $usuario -e $tuserdate >/dev/null 2>&1
    (
        echo "$senha"
        echo "$senha"
    ) | passwd $usuario >/dev/null 2>&1
    echo "$senha" >/etc/SSHPlus/senha/$usuario
    echo "$usuario $limite" >>/root/usuarios.db
    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
        echo "$usuario:$senha:$ex_date:$limite" >/etc/bot/revenda/${message_from_username}/usuarios/$usuario
    }
    dir_teste="/etc/bot/revenda/${message_from_username}/usuarios/$usuario"
    cat <<-EOF >/etc/SSHPlus/userteste/$usuario.sh
	#!/bin/bash
	# USUARIO TESTE
	[[ \$(ps -u "$usuario" | grep -c sshd) != '0' ]] && pkill -u $usuario
	userdel --force $usuario
	grep -v ^$usuario[[:space:]] /root/usuarios.db > /tmp/ph ; cat /tmp/ph > /root/usuarios.db
	[[ -e $dir_teste ]] && rm $dir_teste
	rm /etc/SSHPlus/senha/$usuario > /dev/null 2>&1
	rm /etc/SSHPlus/userteste/$usuario.sh
	EOF
    chmod +x /etc/SSHPlus/userteste/$usuario.sh
    echo "/etc/SSHPlus/userteste/$usuario.sh" | at now + $t_time hour >/dev/null 2>&1
    [[ "$t_time" == '1' ]] && hrs="hora" || hrs="horas"
    [[ "$(ls /etc/bot/arquivos | wc -l)" != '0' ]] && {
        for arqv in $(ls /etc/bot/arquivos); do
            ShellBot.sendDocument --chat_id ${message_from_id[$id]} \
                --document "@/etc/bot/arquivos/$arqv" \
                --caption "$(echo -e "✅ Creado Exitosamente ✅\n\n♻️SSH Privada ♻️\n\n🔥⚡️⚡️ EL MEJOR SERVICIO ⚡️⚡️🔥\n======================\n=❌NO SPAM\n=❌NO DDOS\n=❌NO HACKING\n=❌NO CARDING\n=❌NO TORRENT\n=❌NO MULTILOGIN\n=======================\n\n\nᗚ Username • ๛ <code>$usuario</code>\nᗚ Password • ๛ <code>1234</code>\n\n\nᗚ Dominios\nᗚ Puerto 80 • ๛ <code>f.cerebrocol.com</code>\nᗚ Puerto 443 • ๛ <code>f.netcol.nl</code>\n\n⏳ ᗚ Expire • $t_time $hrs")\n࿂ SSH •  22\n࿂ SSL •  443\n࿂ Squid  •  8080\n࿂ Dropbear •  80\n[-] ═───────◇───────═\n࿂ Badvpn •  7300\n [-] ═───────◇───────═\n›☬ • ═◇ SERVICIOS VIP ◇═ • ☬" \
                --parse_mode html
        done
        return 0
    } || {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "✅ <b>Creado Exitosamente</b> ✅\n\n♻️SSH Privada ♻️\n\n🔥⚡️⚡️ EL MEJOR SERVICIO ⚡️⚡️🔥\n======================\n=❌NO SPAM\n=❌NO DDOS\n=❌NO HACKING\n=❌NO CARDING\n=❌NO TORRENT\n=❌NO MULTILOGIN\n=======================\n\n\nᗚ IP • ๛ $(cat /etc/IP)\nᗚ Username • ๛ <code>$usuario</code>\nᗚ Password • ๛ <code>1234</code>\n\n\nᗚ Dominios\nᗚ Puerto 80 • ๛ <code>f.cerebrocol.com</code>\nᗚ Puerto 443 • ๛ <code>f.netcol.nl</code>\n\n⏳ ᗚ Expire • $t_time $hrs")\n࿂ SSH •  22\n࿂ SSL •  443\n࿂ Squid  •  8080\n࿂ Dropbear •  80\n[-] ═───────◇───────═\n࿂ Badvpn •  7300\n [-] ═───────◇───────═\n›☬ • ═◇ SERVICIOS VIP ◇═ • ☬" \
            --parse_mode html
        return 0
    }
}

fun_exp_user() {
    if [[ "${callback_query_from_id[$id]}" == "$id_admin" ]]; then
        [[ $(cat /root/usuarios.db | wc -l) == '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "You haven't created a user yet!"
            return 0
        }
        datenow=$(date +%s)
        for user in $(cat /etc/passwd | awk -F : '$3 >= 1000 {print $1}' | grep -v nobody); do
            expdate=$(chage -l $user | awk -F: '/Account expires/{print $2}')
            echo $expdate | grep -q never && continue
            datanormal=$(date -d"$expdate" '+%d/%m/%Y')
            expsec=$(date +%s --date="$expdate")
            diff=$(echo $datenow - $expsec | bc -l)
            echo $diff | grep -q ^\- && continue
            pkill -u $user
            userdel --force $user
            grep -v ^$user[[:space:]] /root/usuarios.db >/tmp/ph
            cat /tmp/ph >/root/usuarios.db
            [[ -e /etc/bot/info-users/$user ]] && rm /etc/bot/info-users/$user
            [[ -e /etc/SSHPlus/userteste/$user.sh ]] && rm /etc/SSHPlus/userteste/$user.sh
            [[ "$(ls /etc/bot/revenda)" != '0' ]] && {
                for ex in $(ls /etc/bot/revenda); do
                    [[ -e /etc/bot/revenda/$exp/usuarios/$user ]] && rm /etc/bot/revenda/$ex/usuarios/$user
                done
            }
        done
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⌛️ REMOVED EXPIRED SSH USERS"
        return 0
    elif [[ "$(grep -wc "${callback_query_from_username}" $ativos)" != '0' ]]; then
        [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
            return 0
        }
        [[ $(ls /etc/bot/revenda/${callback_query_from_username}/usuarios | wc -l) == '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "You haven't created a user yet!"
            return 0
        }
        datenow=$(date +%s)
        dir_user="/etc/bot/revenda/${callback_query_from_username}/usuarios"
        for user in $(ls $dir_user); do
            expdate=$(chage -l $user | awk -F: '/Account expires/{print $2}')
            echo $expdate | grep -q never && continue
            datanormal=$(date -d"$expdate" '+%d/%m/%Y')
            expsec=$(date +%s --date="$expdate")
            diff=$(echo $datenow - $expsec | bc -l)
            echo $diff | grep -q ^\- && continue
            pkill -f $user
            userdel --force $user
            grep -v ^$user[[:space:]] /root/usuarios.db >/tmp/ph
            cat /tmp/ph >/root/usuarios.db
            [[ -e /etc/SSHPlus/userteste/$user.sh ]] && rm /etc/SSHPlus/userteste/$user.sh
            [[ -e "$dir_user/$user" ]] && rm $dir_user/$user
        done
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⌛️ REMOVED EXPIRED SSH USERS"
        return 0
    else
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "$(echo -e 🚫 ACCESS DENIED 🚫)"
        return 0
    fi
}

relatorio_rev() {
    if [[ "${callback_query_from_id[$id]}" = "$id_admin" ]]; then
        _ons=$(ps -x | grep sshd | grep -v root | grep priv | wc -l)
        _tuser=$(awk -F: '$3>=1000 {print $1}' /etc/passwd | grep -v nobody | wc -l)
        [[ -e /etc/openvpn/openvpn-status.log ]] && _onop=$(grep -c "10.8.0" /etc/openvpn/openvpn-status.log) || _onop="0"
        [[ -e /etc/default/dropbear ]] && _drp=$(ps aux | grep dropbear | grep -v grep | wc -l) _ondrp=$(($_drp - 1)) || _ondrp="0"
        _onli=$(($_ons + $_onop + $_ondrp))
        _cont_rev=$(echo $(grep -wc revenda $ativos) - $(grep -wc revenda $suspensos) | bc)
        _cont_sus=$(grep -wc revenda $suspensos)
        _cont_sub=$(grep -wc subrevenda $ativos)
        _cont_revt=$(grep -wc revenda $ativos)
        local msg
        msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        msg+="<b>📊 REPORT | INFORMATION</b>\n"
        msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
        msg+="<b>Total users:</b> $_tuser\n"
        msg+="<b>Online users:</b> $_onli\n"
        msg+="<b>Active Resellers:</b> $_cont_rev\n"
        msg+="<b>Suspended Resellers:</b> $_cont_sus\n"
        msg+="<b>Sub-Resellers:</b> $_cont_sub\n\n"
        msg+="<b>User:</b> @${callback_query_from_username}\n"
        msg+="<b>ID:</b> <code>${callback_query_from_id}</code>\n"
        [[ $_cont_revt != '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "📊CREATING REPORT!"
        } || {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️NO RESELLER FOUND!"
            return 0
        }
        echo -e "RESELLER REPORT\n\nTotal: $_cont_revt  -  $(printf 'Data: %(%d/%m/%Y)T\n')\n=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=" >/tmp/Relatorio.txt
        while read _revlist; do
            _nome_rev="$(echo $_revlist | awk '{print $2}')"
            _limite_rev="$(echo $_revlist | awk '{print $4}')"
            _data_rev="$(echo $_revlist | awk '{print $6}')"
            [[ -e "/etc/bot/revenda/$_nome_rev/$_nome_rev" ]] && {
                _dirsts='revenda'
                _status='Ativo'
            } || {
                _dirsts='suspensos'
                _status='Suspenso'
            }
            _subrev="$(grep -wc SUBREVENDA /etc/bot/$_dirsts/$_nome_rev/$_nome_rev)"
            fun_on() {
                for user in $(ls /etc/bot/$_dirsts/$_nome_rev/usuarios); do
                    [[ $(netstat -nltp | grep 'dropbear' | wc -l) != '0' ]] && drop="$(fun_drop | grep "$user" | wc -l)" || drop=0
                    [[ -e /etc/openvpn/openvpn-status.log ]] && ovp="$(cat /etc/openvpn/openvpn-status.log | grep -E ,"$user", | wc -l)" || ovp=0
                    sqd="$(ps -u $user | grep sshd | wc -l)"
                    conex=$(($sqd + $ovp + $drop))
                    echo -e "$conex"
                done
            }
            [[ "$(ls /etc/bot/$_dirsts/$_nome_rev/usuarios | wc -l)" != '0' ]] && {
                total_on=$(fun_on | paste -s -d + | bc)
                total_users=$(ls /etc/bot/$_dirsts/$_nome_rev/usuarios | wc -l)
            } || {
                total_on='0'
                total_users='0'
            }
            echo -e "\nSTATUS: $_status\nDEALER: @$_nome_rev\nLIMITE: $_limite_rev\nDAYS REMAINING: $_data_rev\nSSH CREATED: $total_users\nSSH ONLINE: $total_on\nSUB-REVENDAS: $_subrev\n\n=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=" >>/tmp/Relatorio.txt
        done <<<"$(grep -w 'revenda' $ativos)"
        ShellBot.sendDocument --chat_id $id_admin \
            --document "@/tmp/Relatorio.txt" \
            --caption "$(echo -e "$msg")" \
            --parse_mode html
        return 0
    elif [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]]; then
        [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️YOU ARE SUSPENDED! CONTACT THE ADMINISTRATOR"
            return 0
        }
        [[ $(grep -wc 'SUBREVENDA' /etc/bot/revenda/${callback_query_from_username}/${callback_query_from_username}) == '0' ]] && {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "⚠️ NO SUB RESELLER FOUND !"
            _cont_limite=$(grep -w ${callback_query_from_username} $ativos | awk '{print $4}')
            fun_verif_limite_rev ${callback_query_from_username}
            _cont_disp=$(echo $_cont_limite - $_result | bc)
            local msg
            msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
            msg+="<b>📊 REPORT | INFORMATION</b>\n"
            msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
            msg+="<b>Limit of Logins:</b> $_cont_limite\n"
            msg+="<b>Available Limit:</b> $_cont_disp\n"
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "$msg" \
                --parse_mode html
            return 0
        }
        fun_contsub() {
            while read _sublist; do
                _usub="$(echo $_sublist | awk '{print $2}')"
                echo $(grep -wc $_usub $suspensos)
            done <<<"$(grep -w 'SUPPORT' /etc/bot/revenda/${callback_query_from_username}/${callback_query_from_username})"
        }
        _cont_limite=$(grep -w ${callback_query_from_username} $ativos | awk '{print $4}')
        fun_verif_limite_rev ${callback_query_from_username}
        _cont_disp=$(echo $_cont_limite - $_result | bc)
        _cont_atv=$(grep -wc SUBREVENDA /etc/bot/revenda/${callback_query_from_username}/${callback_query_from_username})
        _cont_sup=$(fun_contsub | paste -s -d + | bc)
        local msg
        msg="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        msg+="<b>📊 REPORT | INFORMATION</b>\n"
        msg+="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n\n"
        msg+="<b>Limit of Logins:</b> $_cont_limite\n"
        msg+="<b>Available Limit:</b> $_cont_disp\n"
        msg+="<b>Total Sub-Resellers:</b> $_cont_atv\n"
        msg+="<b>Suspended Sub-Resellers:</b> $_cont_sup\n"
        msg+="<b>User:</b> @${callback_query_from_username}\n"
        msg+="<b>ID:</b> <code>${callback_query_from_id}</code>\n"
        echo -e "REPORT OF SUB RESELLERS\n\nTotal: $_cont_atv  -  $(printf 'Data: %(%d/%m/%Y)T\n')\n=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=" >/tmp/Relatorio-${callback_query_from_username}.txt
        while read _sublist; do
            _usub="$(echo $_sublist | awk '{print $2}')"
            _limit_sub=$(echo $_sublist | awk '{print $4}')
            _data_sub=$(grep -w $_usub $ativos | awk '{print $6}')
            [[ -e "/etc/bot/revenda/$_usub/$_usub" ]] && {
                _dirsts='revenda'
                _status='Ativo'
            } || {
                _dirsts='suspensos'
                _status='Suspenso'
            }
            fun_subon() {
                for user in $(ls /etc/bot/$_dirsts/$_usub/usuarios); do
                    [[ $(netstat -nltp | grep 'dropbear' | wc -l) != '0' ]] && drop="$(fun_drop | grep "$user" | wc -l)" || drop=0
                    [[ -e /etc/openvpn/openvpn-status.log ]] && ovp="$(cat /etc/openvpn/openvpn-status.log | grep -E ,"$user", | wc -l)" || ovp=0
                    sqd="$(ps -u $user | grep sshd | wc -l)"
                    conex=$(($sqd + $ovp + $drop))
                    echo -e "$conex"
                done
            }
            [[ "$(ls /etc/bot/$_dirsts/$_usub/usuarios | wc -l)" != '0' ]] && {
                total_on=$(fun_on | paste -s -d + | bc)
                total_users=$(ls /etc/bot/$_dirsts/$_usub/usuarios | wc -l)
            } || {
                total_on='0'
                total_users='0'
            }
            echo -e "\nSTATUS: $_status\nSUB-RESELLER: @$_usub\nLIMIT: $_limit_sub\nDAYS REMAINING: $_data_sub\nSSH CREATED: $total_users\nSSH ONLINE: $total_on\n\n=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=" >>/tmp/Relatorio-${callback_query_from_username}.txt
        done <<<"$(grep -w 'SUBREVENDA' /etc/bot/revenda/${callback_query_from_username}/${callback_query_from_username})"
        ShellBot.sendDocument --chat_id ${callback_query_message_chat_id[$id]} \
            --document "@/tmp/Relatorio-${callback_query_from_username}.txt" \
            --caption "$(echo -e "$msg")" \
            --parse_mode html
        return 0
    else

        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    fi
}

fun_backauto() {
    [[ "${callback_query_from_id[$id]}" = "$id_admin" ]] && {
        [[ ! -d /etc/SSHPlus/backups ]] && {
            mkdir /etc/SSHPlus/backups
            [[ $(crontab -l | grep -c "userbackup") = '0' ]] && (
                crontab -l 2>/dev/null
                echo "0 */6 * * * /bin/userbackup 1"
            ) | crontab -
            s
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "♻️ AUTOMATIC BACKUP ON 🟢"
            return 0
        } || {
            [[ $(crontab -l | grep -c "userbackup") != '0' ]] && crontab -l | grep -v 'userbackup' | crontab -
            [[ -d /etc/SSHPlus/backups ]] && rm -rf /etc/SSHPlus/backups
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "♻️ AUTOMATIC BACKUP DISABLED 🔴"
            return 0
        }
    }
}

backup_auto() {
    ShellBot.sendDocument --chat_id $id_admin \
        --document "@/etc/SSHPlus/backups/backup.vps" \
        --caption "$(echo -e "♻️ AUTOMATIC BACKUP ♻️")"
    rm /etc/SSHPlus/backups/backup.vps
    return 0
}

restaure_backup() {
    [[ ${message_from_id[$id]} == ${id_admin} ]] && {
        [[ "${message_document_file_name}" != 'backup.vps' ]] && return 0
        local file_id
        file_id=${message_document_file_id[$id]}
        if [[ $file_id ]]; then
            [[ -e /tmp/backup.vps ]] && rm /tmp/backup.vps
            [[ "$(ls /tmp | grep -c '.vps')" != '0' ]] && {
                for i in $(ls /tmp | grep '.vps'); do
                    rm /tmp/$i
                done
            }
            ShellBot.getFile --file_id $file_id
            if ShellBot.downloadFile --file_path "${return[file_path]}" --dir "/tmp"; then
                msg='<b>♻️ BACKUP FILE ♻️</b>\n\n<i>The uploaded file is a file\nbackup users!</i>'
                ShellBot.sendMessage --chat_id ${id_admin} \
                    --text "$(echo -e "$msg")" \
                    --parse_mode html
                ShellBot.sendMessage --chat_id ${id_admin} \
                    --text 'Deseja restaurar ? [sim | nao]' \
                    --reply_markup "$(ShellBot.ForceReply)"
            fi
        fi
        return 0
    }
}
msg_bem_vindo() {
    local msg
    msg="✌️😃 HOLA <b>${message_from_first_name[$id]}</b>\n\nBIENVENIDO(a)\n\n"
    msg+="Para acceder al menu\nHaga click o ejecute [ /menu ]\n\n"
    msg+="Para mas informacion\nHaga click o ejecute [ /ajuda ]\n\n"
    ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
        --text "$(echo -e $msg)" \
        --parse_mode html
    return 0
}

fun_verif_limite_rev() {
    _userrev=$1
    [[ "$(grep -w "$_userrev" $ativos | awk '{print $NF}')" == 'revenda' ]] && {
        echo $_userrev
        [[ $(grep -wc 'SUBREVENDA' /etc/bot/revenda/$_userrev/$_userrev) != '0' ]] && {
            _limsomarev=$(grep -w 'SUBREVENDA' /etc/bot/revenda/$_userrev/$_userrev | awk {'print $4'} | paste -s -d + | bc)
        } || {
            _limsomarev='0'
        }
        [[ $(ls /etc/bot/revenda/$_userrev/usuarios | wc -l) != '0' ]] && {
            _mlim1='0'
            _meus_users="/etc/bot/revenda/$_userrev/usuarios"
            for _user_ in $(ls $_meus_users); do
                _mlim2=$(cat $_meus_users/$_user_ | awk -F : {'print $4'})
                _mlim1=$(echo "${_mlim1} + ${_mlim2}" | bc)
            done
        }
        [[ -z "$_mlim1" ]] && _mlim1='0'
        _result=$(echo "${_limsomarev} + ${_mlim1}" | bc)
    }
    [[ "$(grep -w "$_userrev" $ativos | awk '{print $NF}')" == 'subrevenda' ]] && {
        [[ "$(ls /etc/bot/revenda/$_userrev/usuarios | wc -l)" != '0' ]] && {
            _dir_users="/etc/bot/revenda/$_userrev/usuarios"
            _lim1='0'
            for i in $(ls $_dir_users); do
                _lim2=$(cat $_dir_users/$i | awk -F : {'print $4'})
                _lim1=$(echo "${_lim1} + ${_lim2}" | bc)
            done
        }
        [[ -z "$_lim1" ]] && _lim1='0'
        _result=$(echo "${_lim1}")
    }
}

fun_add_revenda() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "👥 ADD RESELLER 👥\n\nEnter the name:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

criar_rev() {
    file_rev=$1
    [[ -z "$file_rev" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e Erro)"
        _erro='1'
        break
    }
    n_rev=$(sed -n '1 p' $file_rev | cut -d' ' -f2)
    u_rev=$(sed -n '2 p' $file_rev | awk -F '@' {'print $2'})
    l_rev=$(sed -n '3 p' $file_rev | cut -d' ' -f2)
    d_rev=$(sed -n '4 p' $file_rev | cut -d' ' -f2)
    [[ "${message_from_id[$id]}" = "$id_admin" ]] && {
        t_rev='revenda'
    } || {
        t_rev='subrevenda'
        echo -e "SUPPORT: $u_rev LIMITE_SUBREVENDA: $l_rev" >>/etc/bot/revenda/${message_from_username}/${message_from_username}
    }
    mkdir /etc/bot/revenda/"$u_rev"
    mkdir /etc/bot/revenda/"$u_rev"/usuarios
    touch /etc/bot/revenda/"$u_rev"/$u_rev
    echo -e "USER: $u_rev LIMITE: $l_rev DIAS: $d_rev TIPO: $t_rev" >>$ativos
    echo -e "=========================\nLIMITE_REVENDA: $l_rev\nDIAS_REVENDA: $d_rev\n=========================\n" >/etc/bot/revenda/"$u_rev"/$u_rev
    sed -i '$d' $file_rev
    echo -e "Vencimento: $(date "+%d/%m/%Y" -d "+$d_rev days")" >>$file_rev
}

fun_del_rev() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "🗑 REMOVE DEALER 🗑\n\nInform his user [Ex: @sibatrow]:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

del_rev() {
    _cli_rev=$1
    [[ -z "$_cli_rev" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "Erro")"
        return 0
    }
    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
        [[ "$(grep -wc "$_cli_rev" $ativos)" != '0' ]] && {
            [[ -e "/etc/bot/revenda/$_cli_rev/$_cli_rev" ]] && _dirsts='revenda' || _dirsts='suspensos'
            [[ "$(grep -wc 'SUBREVENDA' /etc/bot/$_dirsts/$_cli_rev/$_cli_rev)" != '0' ]] && {
                while read _listsub2; do
                    _usub="$(echo $_listsub2 | awk '{print $2}')"
                    [[ -e "/etc/bot/revenda/$_usub/$_usub" ]] && _dirsts2='revenda' || _dirsts2='suspensos'
                    _dir_users="/etc/bot/$_dirsts2/$_usub/usuarios"
                    [[ "$(ls $_dir_users | wc -l)" != '0' ]] && {
                        for _user in $(ls $_dir_users); do
                            piduser=$(ps -u "$_user" | grep sshd | cut -d? -f1)
                            kill -9 $piduser >/dev/null 2>&1
                            userdel --force "$_user" 2>/dev/null
                            grep -v ^$_user[[:space:]] /root/usuarios.db >/tmp/ph
                            cat /tmp/ph >/root/usuarios.db
                            rm /etc/bot/info-users/$_user
                        done
                    }
                    [[ -d /etc/bot/$_dirsts2/$_usub ]] && rm -rf /etc/bot/$_dirsts2/$_usub >/dev/null 2>&1
                    sed -i "/\b$_usub\b/d" $ativos
                    [[ $(grep -wc "$_usub" $suspensos) != '0' ]] && {
                        sed -i "/\b$_usub\b/d" $suspensos
                    }
                done <<<"$(grep -w 'SUBREVENDA' /etc/bot/$_dirsts/$_cli_rev/$_cli_rev)"
            }
            [[ "$(ls /etc/bot/$_dirsts/$_cli_rev/usuarios | wc -l)" != '0' ]] && {
                for _user in $(ls /etc/bot/$_dirsts/$_cli_rev/usuarios); do
                    piduser=$(ps -u "$_user" | grep sshd | cut -d? -f1)
                    kill -9 $piduser >/dev/null 2>&1
                    userdel --force "$_user" 2>/dev/null
                    grep -v ^$_user[[:space:]] /root/usuarios.db >/tmp/ph
                    cat /tmp/ph >/root/usuarios.db
                    rm /etc/bot/info-users/$_user
                done
            }
            [[ -d /etc/bot/$_dirsts/$_cli_rev ]] && rm -rf /etc/bot/$_dirsts/$_cli_rev >/dev/null 2>&1
            sed -i "/\b$_cli_rev\b/d" $ativos
            [[ $(grep -wc "$_cli_rev" $suspensos) != '0' ]] && {
                sed -i "/\b$_cli_rev\b/d" $suspensos
            }
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "SUCCESSFULLY REMOVED")" \
                --parse_mode html
            return 0
        } || {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e ❌ DEALER DOES NOT EXIST ❌)"
            return 0
        }
    } || {
        [[ "$(grep -wc "$_cli_rev" /etc/bot/revenda/${message_from_username}/${message_from_username})" != '0' ]] && {
            [[ -d /etc/bot/revenda/$_cli_rev ]] && {
                [[ "$(ls /etc/bot/revenda/$_cli_rev/usuarios | wc -l)" != '0' ]] && {
                    for _user in $(ls /etc/bot/revenda/$_cli_rev/usuarios); do
                        piduser=$(ps -u "$_user" | grep sshd | cut -d? -f1)
                        kill -9 $piduser >/dev/null 2>&1
                        userdel --force "$_user" 2>/dev/null
                        grep -v ^$_user[[:space:]] /root/usuarios.db >/tmp/ph
                        cat /tmp/ph >/root/usuarios.db
                        rm /etc/bot/info-users/$_user
                    done
                }
                [[ -d /etc/bot/revenda/$_cli_rev ]] && rm -rf /etc/bot/revenda/$_cli_rev >/dev/null 2>&1
                sed -i "/\b$_cli_rev\b/d" $ativos
                sed -i "/\b$_cli_rev\b/d" /etc/bot/revenda/${message_from_username}/${message_from_username}
            }
            [[ -d /etc/bot/suspensos/$_cli_rev ]] && {
                [[ "$(ls /etc/bot/suspensos/$_cli_rev/usuarios | wc -l)" != '0' ]] && {
                    for _user in $(ls /etc/bot/suspensos/$_cli_rev/usuarios); do
                        piduser=$(ps -u "$_user" | grep sshd | cut -d? -f1)
                        kill -9 $piduser >/dev/null 2>&1
                        userdel --force "$_user" 2>/dev/null
                        grep -v ^$_user[[:space:]] /root/usuarios.db >/tmp/ph
                        cat /tmp/ph >/root/usuarios.db
                        rm /etc/bot/info-users/$_user
                    done
                }
                [[ -d /etc/bot/suspensos/$_cli_rev ]] && rm -rf /etc/bot/suspensos/$_cli_rev >/dev/null 2>&1
                sed -i "/\b$_cli_rev\b/d" $ativos
                sed -i "/\b$_cli_rev\b/d" $suspensos
                sed -i "/\b$_cli_rev\b/d" /etc/bot/revenda/${message_from_username}/${message_from_username}
            }
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "SUCCESSFULLY REMOVED")" \
                --parse_mode html
            return 0
        } || {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e ❌ DEALER DOES NOT EXIST ❌)"
            return 0
        }
    }
}

fun_lim_rev() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "♾CHANGE RESALE LIMIT ♾\n\nInform his user [Ex: @sibatrow]:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

lim_rev() {
    _file_lim=$1
    [[ -z "$_file_lim" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "Erro")"
        return 0
    }
    _rev_usern=$(grep -w 'Revendedor' $_file_lim | awk -F '@' {'print $2'})
    new_l=$(grep -w 'Limite' $_file_lim | awk {'print $2'})
    [[ -d /etc/bot/revenda/$_rev_usern ]] && {
        l_old=$(grep -w 'LIMITE_REVENDA' /etc/bot/revenda/$_rev_usern/$_rev_usern | awk {'print $2'})
        sed -i "/LIMITE_REVENDA/ s/$l_old/$new_l/g" /etc/bot/revenda/$_rev_usern/$_rev_usern
        sed -i "/$_rev_usern/ s/LIMITE: $l_old/LIMITE: $new_l/" $ativos
        [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
            sed -i "/\b$_rev_usern\b/ s/$l_old/$new_l/g" /etc/bot/revenda/${message_from_username}/${message_from_username}
        }
        echo $_rev_usern
    } || {
        l_old=$(grep -w 'LIMITE_REVENDA' /etc/bot/suspensos/$_rev_usern/$_rev_usern | awk {'print $2'})
        sed -i "/LIMITE_REVENDA/ s/$l_old/$new_l/g" /etc/bot/suspensos/$_rev_usern/$_rev_usern
        sed -i "/\b$_rev_usern\b/ s/LIMITE: $l_old/LIMITE: $new_l/" $ativos
        sed -i "/\b$_rev_usern\b/ s/LIMITE: $l_old/LIMITE: $new_l/" $suspensos
        [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
            sed -i "/\b$_rev_usern\b/ s/$l_old/$new_l/" /etc/bot/revenda/${message_from_username}/${message_from_username}
        }
        echo $_rev_usern
    }
}

fun_dat_rev() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "📆 CHANGE RESALE DATE 📆\n\nInform his user [Ex: @sibatrow]:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

dat_rev() {
    _datfile=$1
    [[ -z "$_datfile" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "Erro")"
        _erro='1'
        return 0
    }
    _revd=$(grep -w 'Revendedor' $_datfile | cut -d'@' -f2)
    new_d=$(grep -w 'Data' $_datfile | awk '{print $NF}')
    [[ -d "/etc/bot/suspensos/$_revd" ]] && {
        [[ "$(ls /etc/bot/suspensos/$_revd/usuarios | wc -l)" != '0' ]] && {
            for _user in $(ls /etc/bot/suspensos/$_revd/usuarios); do
                usermod -U $_user
            done
        }
        d_old=$(grep -w 'DIAS_REVENDA' /etc/bot/suspensos/$_revd/$_revd | awk {'print $2'})
        sed -i "/\b$_revd\b/ s/DIAS: $d_old/DIAS: $new_d/" $ativos
        sed -i "/DIAS_REVENDA/ s/$d_old/$new_d/" /etc/bot/suspensos/$_revd/$_revd
        [[ "$(grep -wc 'SUBREVENDA' /etc/bot/suspensos/$_revd/$_revd)" != '0' ]] && {
            while read _listsub; do
                _usub="$(echo $_listsub | awk '{print $2}')"
                [[ "$(ls /etc/bot/suspensos/$_usub/usuarios | wc -l)" != '0' ]] && {
                    for _user in $(ls /etc/bot/suspensos/$_usub/usuarios); do
                        usermod -U $_user
                    done
                }
                mv /etc/bot/suspensos/$_usub /etc/bot/revenda/$_usub
                sed -i "/\b$_usub\b/d" $suspensos
            done <<<"$(grep -w 'SUBREVENDA' /etc/bot/suspensos/$_revd/$_revd)"
        }
        mv /etc/bot/suspensos/$_revd /etc/bot/revenda/$_revd
        sed -i "/\b$_revd\b/d" $suspensos
        sed -i "s;$new_d;$(date "+%d/%m/%Y" -d "+$new_d days");" $_datfile
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "⚠️ $_revd WAS SUSPENDED AND WAS REACTIVATED !")" \
            --parse_mode html
    } || {
        d_old=$(grep -w 'DIAS_REVENDA' /etc/bot/revenda/$_revd/$_revd | awk {'print $2'})
        sed -i "/\b$_revd\b/ s/DIAS: $d_old/DIAS: $new_d/" $ativos
        sed -i "/DIAS_REVENDA/ s/$d_old/$new_d/" /etc/bot/revenda/$_revd/$_revd
        sed -i "s;$new_d;$(date "+%d/%m/%Y" -d "+$new_d days");" $_datfile
    }
}

fun_list_rev() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    if [[ "${callback_query_from_id[$id]}" == "$id_admin" ]]; then
        local msg1
        msg1="=×=×=×=×=×=×=×=×=×=×=×=×=×=\n📃 LIST OF RESELLERS !\n=×=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        [[ "$(grep -wc 'revenda' $ativos)" != '0' ]] && {
            while read _atvs; do
                _uativ="$(echo $_atvs | awk '{print $2}')"
                [[ "$(grep -wc "$_uativ" $suspensos)" == '0' ]] && _stsrev='ATIVO' || _stsrev='SUSPENSO'
                msg1+="• @$_uativ - $_stsrev\n"
            done <<<"$(grep -w 'revenda' /etc/bot/lista_ativos)"
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "$(echo -e "$msg1")" \
                --parse_mode html
            return 0
        } || {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "VC DOES NOT HAVE RESELLERS"
            return 0
        }
    elif [[ "$(grep -w ${callback_query_from_username} $ativos | awk '{print $NF}')" == 'revenda' ]]; then
        _patch="/etc/bot/revenda"
        local msg1
        msg1="=×=×=×=×=×=×=×=×=×=×=×=×=\n📃 LIST OF SUB RESELLERS !\n=×=×=×=×=×=×=×=×=×=×=×=×=\n"
        [[ "$(grep -wc "SUBREVENDA" $_patch/${callback_query_from_username}/${callback_query_from_username})" != '0' ]] && {
            while read _listsub; do
                _usub="$(echo $_listsub | awk '{print $2}')"
                [[ "$(grep -wc "$_usub" $suspensos)" == '0' ]] && _usts='ATIVO' || _usts='SUSPENSO'
                msg1+="• @$_usub - $_usts\n"
            done <<<"$(grep -w 'SUBREVENDA' $_patch/${callback_query_from_username}/${callback_query_from_username})"
            ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
                --text "$(echo -e "$msg1")" \
                --parse_mode html
            return 0
        } || {
            ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
                --text "VC DOES NOT HAVE SUB RESELLERS"
            return 0
        }
    else
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACESSO NEGADO 🚫"
        return 0
    fi
}

fun_susp_rev() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.sendMessage --chat_id ${callback_query_message_chat_id[$id]} \
            --text "🔒 SUSPEND RESELLER 🔒\n\nInform his user [Ex: @sibatrow]:" \
            --reply_markup "$(ShellBot.ForceReply)"
    } || {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "🚫 ACCESS DENIED 🚫"
        return 0
    }
}

susp_rev() {
    _revs=$1
    [[ -z "$_revs" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "Erro")"
        return 0
    }
    [[ -d "/etc/bot/suspensos/$_revs" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "THE USER IS ALREADY SUSPENDED !")" \
            --parse_mode html
        return 0
    }
    [[ ! -d "/etc/bot/revenda/$_revs" ]] && {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "THE USER DOES NOT EXIST !")" \
            --parse_mode html
        return 0
    }
    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
        [[ "$(grep -wc 'SUBREVENDA' /etc/bot/revenda/$_revs/$_revs)" != '0' ]] && {
            while read _listsub3; do
                _usub3="$(echo $_listsub3 | awk '{print $2}')"
                _dir_users="/etc/bot/revenda/$_usub3/usuarios"
                [[ "$(ls $_dir_users | wc -l)" != '0' ]] && {
                    for _user in $(ls $_dir_users); do
                        usermod -L $_user
                        pkill -f $_user
                    done
                }
                mv /etc/bot/revenda/$_usub3 /etc/bot/suspensos/$_usub3
                grep -w "$_usub3" $ativos >>$suspensos
            done <<<"$(grep -w 'SUBREVENDA' /etc/bot/revenda/$_revs/$_revs)"
        }
        [[ "$(ls /etc/bot/revenda/$_revs/usuarios | wc -l)" != '0' ]] && {
            for _user_ in $(ls /etc/bot/revenda/$_revs/usuarios); do
                usermod -L $_user_
                pkill -f $_user_
            done
        }
        mv /etc/bot/revenda/$_revs /etc/bot/suspensos/$_revs
        grep -w "$_revs" $ativos >>$suspensos
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "SUCCESSFULLY SUSPENDED")" \
            --parse_mode html
        return 0
    } || {
        [[ "$(grep -wc "$_revs" /etc/bot/revenda/${message_from_username}/${message_from_username})" != '0' ]] && {
            [[ "$(ls /etc/bot/revenda/$_revs/usuarios | wc -l)" != '0' ]] && {
                for _user_ in $(ls /etc/bot/revenda/$_revs/usuarios); do
                    usermod -L $_user_
                    pkill -f $_user_
                done
            }
            mv /etc/bot/revenda/$_revs /etc/bot/suspensos/$_revs
            grep -w "$_revs" $ativos >>$suspensos
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "SUCCESSFULLY SUSPENDED")" \
                --parse_mode html
            return 0
        } || {
            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                --text "$(echo -e "THE SUB DEALER DOES NOT EXIST")" \
                --parse_mode html
            return 0
        }
    }
}

infouserbot() {
    [[ $(grep -wc ${message_from_username} $ativos) != '0' ]] && {
        _cont_limite=$(grep -w ${message_from_username} $ativos | awk '{print $4}')
        fun_verif_limite_rev ${message_from_username}
        _cont_disp=$(echo $_cont_limite - $_result | bc)
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "<b>NAME: </> ${message_from_first_name[$(ShellBot.ListUpdates)]}\n<b>USER:</>" "@${message_from_username[$(ShellBot.ListUpdates)]:-null}")\n<b>ID:</> ${message_from_id[$(ShellBot.ListUpdates)]}\nACESSO: REVENDA\n<b>LIMITE TOTAL:</b> $_cont_limite\n<b>LIMITE RESTANTE:</b> $_cont_disp" \
            --parse_mode html
        return 0
    } || {
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "$(echo -e "<b>NAME: </> ${message_from_first_name[$(ShellBot.ListUpdates)]}\n<b>USER:</>" "@${message_from_username[$(ShellBot.ListUpdates)]:-null}")\n<b>ID:</> ${message_from_id[$(ShellBot.ListUpdates)]} " \
            --parse_mode html
        return 0
    }
}

fun_menurevenda() {
    [[ "$(grep -wc ${callback_query_from_username} $suspensos)" != '0' ]] && {
        ShellBot.answerCallbackQuery --callback_query_id ${callback_query_id[$id]} \
            --text "⚠️ ESTAS SUSPENDIDO, CONTACTA AL ADMIN @NETCOLVIP "
        return 0
    }
    [[ "${callback_query_from_id[$id]}" == "$id_admin" ]] || [[ "$(grep -wc ${callback_query_from_username} $ativos)" != '0' ]] && {
        ShellBot.editMessageText --chat_id ${callback_query_message_chat_id[$id]} \
            --message_id ${callback_query_message_message_id[$id]} \
            --text "SELECT AN OPTION BELOW:" \
            --reply_markup "$(ShellBot.InlineKeyboardMarkup --button 'menu4')"
        return 0
    }
}

# LISTA MENU ADMIN
unset menu1
menu1=''
ShellBot.InlineKeyboardButton --button 'menu1' --line 1 --text 'CREAR USUARIO' --callback_data '_criaruser'
ShellBot.InlineKeyboardButton --button 'menu1' --line 2 --text 'CREAR PRUEBA' --callback_data '_criarteste'
ShellBot.InlineKeyboardButton --button 'menu1' --line 3 --text 'ELIMINAR USER' --callback_data '_deluser'
ShellBot.InlineKeyboardButton --button 'menu1' --line 4 --text 'CAMBIAR CLAVE' --callback_data '_altsenha'
ShellBot.InlineKeyboardButton --button 'menu1' --line 5 --text 'ALTERAR LIMITE' --callback_data '_altlimite'
ShellBot.InlineKeyboardButton --button 'menu1' --line 6 --text 'CAMBIAR FECHA' --callback_data '_altdata'
ShellBot.InlineKeyboardButton --button 'menu1' --line 7 --text 'USUARIOS ONLINE' --callback_data '_monitor'
ShellBot.InlineKeyboardButton --button 'menu1' --line 8 --text 'INFO USUARIOS' --callback_data '_verusers'
ShellBot.InlineKeyboardButton --button 'menu1' --line 8 --text 'ELIMINAR EXPIRADOS' --callback_data '_expirados'
ShellBot.InlineKeyboardButton --button 'menu1' --line 1 --text 'INFO VPS' --callback_data '_infovps'
ShellBot.InlineKeyboardButton --button 'menu1' --line 2 --text 'OPTIMIZAR' --callback_data '_OPTIMIZAR'
ShellBot.InlineKeyboardButton --button 'menu1' --line 3 --text 'REVENTAS' --callback_data '_opcoesrev'
ShellBot.InlineKeyboardButton --button 'menu1' --line 4 --text 'BACKUP USUARIOS' --callback_data '_backupusers'
ShellBot.InlineKeyboardButton --button 'menu1' --line 5 --text "AUTO BACKUP" --callback_data '_autobkp'
ShellBot.InlineKeyboardButton --button 'menu1' --line 6 --text 'RELATORIO' --callback_data '_relatorio'
ShellBot.InlineKeyboardButton --button 'menu1' --line 7 --text 'AYUDA' --callback_data '_ajuda'
ShellBot.regHandleFunction --function fun_adduser --callback_data _criaruser
ShellBot.regHandleFunction --function fun_add_teste --callback_data _criarteste
ShellBot.regHandleFunction --function fun_deluser --callback_data _deluser
ShellBot.regHandleFunction --function alterar_senha --callback_data _altsenha
ShellBot.regHandleFunction --function alterar_limite --callback_data _altlimite
ShellBot.regHandleFunction --function alterar_data --callback_data _altdata
ShellBot.regHandleFunction --function fun_down --callback_data _arqdown
ShellBot.regHandleFunction --function monitor_ssh --callback_data _monitor
ShellBot.regHandleFunction --function ver_users --callback_data _verusers
ShellBot.regHandleFunction --function fun_exp_user --callback_data _expirados
ShellBot.regHandleFunction --function otimizer --callback_data _otimizar
ShellBot.regHandleFunction --function speed_test --callback_data _speedteste
ShellBot.regHandleFunction --function infovps --callback_data _infovps
ShellBot.regHandleFunction --function backup_users --callback_data _backupusers
ShellBot.regHandleFunction --function fun_backauto --callback_data _autobkp
ShellBot.regHandleFunction --function relatorio_rev --callback_data _relatorio
ShellBot.regHandleFunction --function fun_ajuda --callback_data _ajuda
ShellBot.regHandleFunction --function fun_menurevenda --callback_data _opcoesrev
unset keyboard1
keyboard1="$(ShellBot.InlineKeyboardMarkup -b 'menu1')"

# LISTA MENU REVENDEDOR
unset menu2
menu2=''
ShellBot.InlineKeyboardButton --button 'menu2' --line 1 --text 'CREAR USUARIO' --callback_data '_criaruser2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 1 --text 'CREAR PRUEBA' --callback_data '_criarteste2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 2 --text 'ELIMINAR USER' --callback_data '_deluser2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 2 --text 'USUARIOS ONLINE' --callback_data '_monitor2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 3 --text 'ALTERAR LIMITE' --callback_data '_altlimite2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 3 --text 'INFO USUARIOS' --callback_data '_verusers2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 4 --text 'CAMBIAR CLAVE' --callback_data '_altsenha2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 4 --text 'EXPIRADOS' --callback_data '_expirados2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 5 --text 'CAMBIAR FECHA' --callback_data '_altdata2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 5 --text 'REVENTA' --callback_data '_opcoesrev2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 6 --text 'RELATORIO' --callback_data '_relatorio2'
ShellBot.InlineKeyboardButton --button 'menu2' --line 6 --text 'AYUDA' --callback_data '_ajuda2'
ShellBot.regHandleFunction --function fun_adduser --callback_data _criaruser2
ShellBot.regHandleFunction --function fun_add_teste --callback_data _criarteste2
ShellBot.regHandleFunction --function fun_deluser --callback_data _deluser2
ShellBot.regHandleFunction --function alterar_senha --callback_data _altsenha2
ShellBot.regHandleFunction --function alterar_limite --callback_data _altlimite2
ShellBot.regHandleFunction --function alterar_data --callback_data _altdata2
ShellBot.regHandleFunction --function monitor_ssh --callback_data _monitor2
ShellBot.regHandleFunction --function ver_users --callback_data _verusers2
ShellBot.regHandleFunction --function fun_exp_user --callback_data _expirados2
ShellBot.regHandleFunction --function relatorio_rev --callback_data _relatorio2
ShellBot.regHandleFunction --function fun_menurevenda --callback_data _opcoesrev2
ShellBot.regHandleFunction --function fun_ajuda --callback_data _ajuda2
unset keyboard2
keyboard2="$(ShellBot.InlineKeyboardMarkup -b 'menu2')"

#LISTA MUNU SUB REVENDEDOR
unset menu3
menu3=''
ShellBot.InlineKeyboardButton --button 'menu3' --line 1 --text 'CREAR USUARIO' --callback_data '_criaruser3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 1 --text 'CREAR PRUEBA' --callback_data '_criarteste3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 2 --text 'ELIMINAR USER' --callback_data '_deluser3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 2 --text 'USUARIOS ONLINE' --callback_data '_monitor3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 3 --text 'ALTERAR LIMITE' --callback_data '_altlimite3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 3 --text 'INFO USUARIOS' --callback_data '_verusers3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 4 --text 'CAMBIAR CLAVE' --callback_data '_altsenha3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 4 --text 'EXPIRADOS' --callback_data '_expirados3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 5 --text 'CAMBIAR FECHA' --callback_data '_altdata3'
ShellBot.InlineKeyboardButton --button 'menu3' --line 5 --text 'AYUDA' --callback_data '_ajuda3'
ShellBot.regHandleFunction --function fun_adduser --callback_data _criaruser3
ShellBot.regHandleFunction --function fun_add_teste --callback_data _criarteste3
ShellBot.regHandleFunction --function fun_deluser --callback_data _deluser3
ShellBot.regHandleFunction --function alterar_senha --callback_data _altsenha3
ShellBot.regHandleFunction --function alterar_limite --callback_data _altlimite3
ShellBot.regHandleFunction --function alterar_data --callback_data _altdata3
ShellBot.regHandleFunction --function monitor_ssh --callback_data _monitor3
ShellBot.regHandleFunction --function ver_users --callback_data _verusers3
ShellBot.regHandleFunction --function fun_exp_user --callback_data _expirados3
ShellBot.regHandleFunction --function fun_ajuda --callback_data _ajuda3
unset keyboard3
keyboard3="$(ShellBot.InlineKeyboardMarkup -b 'menu3')"

#LISTA MENU OPCOES REVENDA
unset menu4
menu4=''
ShellBot.InlineKeyboardButton --button 'menu4' --line 1 --text 'ADICIONAR REVENDA' --callback_data '_addrev'
ShellBot.InlineKeyboardButton --button 'menu4' --line 2 --text 'ELIMINAR REVENDA' --callback_data '_delrev'
ShellBot.InlineKeyboardButton --button 'menu4' --line 3 --text 'ALTERAR LIMITE REVENDA' --callback_data '_limrev'
ShellBot.InlineKeyboardButton --button 'menu4' --line 4 --text 'CAMBIAR FECHA REVENDA' --callback_data '_datrev'
ShellBot.InlineKeyboardButton --button 'menu4' --line 5 --text 'LISTAR REVENDA' --callback_data '_listrev'
ShellBot.InlineKeyboardButton --button 'menu4' --line 6 --text 'SUSPENDER REVENDA' --callback_data '_susprevendas'
ShellBot.regHandleFunction --function fun_add_revenda --callback_data _addrev
ShellBot.regHandleFunction --function fun_del_rev --callback_data _delrev
ShellBot.regHandleFunction --function fun_lim_rev --callback_data _limrev
ShellBot.regHandleFunction --function fun_dat_rev --callback_data _datrev
ShellBot.regHandleFunction --function fun_list_rev --callback_data _listrev
ShellBot.regHandleFunction --function fun_susp_rev --callback _susprevendas
unset keyboard4
keyboard4="$(ShellBot.InlineKeyboardMarkup -b 'menu4')"

while :; do
    [[ -e "/etc/SSHPlus/backups/backup.vps" ]] && {
        backup_auto
    }
    #Obtem as atualizações
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 35
    #Lista o índice das atualizações
    for id in $(ShellBot.ListUpdates); do
        #Inicio thread
        (
            ShellBot.watchHandle --callback_data ${callback_query_data[$id]}
            # Requisições somente no privado.
            [[ ${message_chat_type[$id]} != 'private' ]] && continue
            [[ ${message_text[$id]} ]] || restaure_backup
            CAD_ARQ=/tmp/cad.${message_from_id[$id]}
            if [[ ${message_entities_type[$id]} == bot_command ]]; then
                #Verifica se a mensagem enviada pelo usuário é um comando válido.
                case ${message_text[$id]} in
                *)
                    :
                    #comandos
                    comando=(${message_text[$id]})
                    [[ "${comando[0]}" = "/start" ]] && msg_bem_vindo
                    [[ "${comando[0]}" = "/menu" ]] && fun_menu
                    [[ "${comando[0]}" = "/info" ]] && infouserbot
                    [[ "${comando[0]}" = "/hrlp" || "${comando[0]}" = "/ajuda" || "${comando[0]}" = "/ayuda" ]] && fun_ajuda
                    [[ "${comando[0]}" = "/bot" || "${comando[0]}" = "/sobre" ]] && sobremim
		    [[ "${comando[0]}" = "/precios" ]] && precios
      
                    ;;
                esac
            fi
            if [[ ${message_reply_to_message_message_id[$id]} ]]; then
                # Analisa a interface de resposta.
                case ${message_reply_to_message_text[$id]} in
                '👤 CREEAR USUARIO 👤\n\nUsername:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ "$(awk -F : '$3 >= 1000 { print $1 }' /etc/passwd | grep -w ${message_text[$id]} | wc -l)" != '0' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error! INVALID USER ❌\n\n⚠️ Enter Another Name..")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    [ "${message_text[$id]}" == 'root' ] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ ERROR! INVALID USER ❌\n\n⚠️ Enter Another Name..")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    sizemin=$(echo -e ${#message_text[$id]})
                    [[ "$sizemin" -lt '4' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error !\n\nUse at least 4 characters\n[EX: sithum]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    sizemax=$(echo -e ${#message_text[$id]})
                    [[ "$sizemax" -gt '10' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error !\n\nUse a maximum of 8 characters\n[EX: sbatrow]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    echo "Nome: ${message_text[$id]}" >$CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Senha:' \
                        --reply_markup "$(ShellBot.ForceReply)" # Força a resposta.
                    ;;
                'Senha:')
                    sizepass=$(echo -e ${#message_text[$id]})
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ "$sizepass" -lt '4' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error !\n\nUse at least 4 characters\n[EX: sithum]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    echo "Senha: ${message_text[$id]}" >>$CAD_ARQ
                    # Próximo campo.
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Limite:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    
                    ;;
                'Limite:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\nUse only numbers [EX: 1]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
                        _limTotal=$(grep -w "${message_from_username}" $ativos | awk '{print $4}')
                        fun_verif_limite_rev ${message_from_username}
                        _limsomarev2=$(echo "$_result + ${message_text[$id]}" | bc)
                        [[ "$_limsomarev2" -gt "$_limTotal" ]] && {
                            _restant1=$(($_limTotal - $_result))
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ You don't have enough limit\n\nAvailable limit: $_restant1 ")" \
                                --parse_mode html
                            >$CAD_ARQ
                            break
                        }
                    }
                    echo "Limite: ${message_text[$id]}" >>$CAD_ARQ
                    # Próximo campo.
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Validity in days: ' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;

                'Validity in days:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\nUse only numbers [EX: 30]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    info_data=$(date '+%d/%m/%C%y' -d " +${message_text[$id]} days")
                    echo "Validade: $info_data" >>$CAD_ARQ
                    criar_user $CAD_ARQ
                    [[ "(grep -w ${message_text[$id]} /etc/passwd)" = '0' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e ❌ Erro ao criar usuario !)" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    [[ "$(ls /etc/bot/arquivos | wc -l)" != '0' ]] && {
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text '📥 AVAILABLE FILES 📥\n\nDo you want to download? Yes or no?:' \
                            --reply_markup "$(ShellBot.ForceReply)"
                    } || {
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text "<b>✅ CREADO CON ÉXITO ✅</b>\n\nUSUARIO: <code>$(awk -F " " '/Nome/ {print $2}' $CAD_ARQ)</code>\nCONTRASEÑA: <code>$(awk -F " " '/Senha/ {print $2}' $CAD_ARQ)</code>\nLIMITE: $(awk -F " " '/Limite/ {print $2}' $CAD_ARQ)\nCADUCA EL: $(awk -F " " '/Validade/ {print $2}' $CAD_ARQ)" \
                            --parse_mode html
                        break
                    }
                    ;;
                '📥 AVAILABLE FILES 📥\n\nDo you want to download? Yes or no?:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([A-Za-z]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Invalid option ❌\n\n⚠️ Use only letters [EX: sithum batrow]")" \
                            --parse_mode html
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text "<b>✅ CREADO CON ÉXITO ✅</b>\n\nUSUARIO: <code>$(awk -F " " '/Nome/ {print $2}' $CAD_ARQ)</code>\nCONTRASEÑA: <code>$(awk -F " " '/Senha/ {print $2}' $CAD_ARQ)</code>\nLIMITE: $(awk -F " " '/Limite/ {print $2}' $CAD_ARQ)\nCADUCA EL: $(awk -F " " '/Validade/ {print $2}' $CAD_ARQ)" \
                            --parse_mode html
                        break
                    }
                    [[ "${message_text[$id]}" = @(Sim|sim|SIM) ]] && {
                        msg_cli="≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠\n"
                        msg_cli+="<b>PRE-CONFIGURED FILES </b>❗\n"
                        msg_cli+="≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠\n\n"
                        for _file in $(ls /etc/bot/arquivos); do
                            i=$(($i + 1))
                            msg_cli+="<b>[$i]</b> - $_file\n"
                        done
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "$msg_cli")" \
                            --parse_mode html
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text 'Enter the File Number:' \
                            --reply_markup "$(ShellBot.ForceReply)"
                    } || {
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text "<b>✅ CREADO EXITOSAMENTE ✅</b>\n\n♻️SSH Privada ♻️\n\n🔥⚡️⚡️ @drowkid01 🇲🇽 ⚡️⚡️🔥\n======================\n=❌NO SPAM\n=❌NO DDOS\n=❌NO HACKING\n=❌NO CARDING\n=❌NO TORRENT\n=❌NO MULTILOGIN\n=======================\n\n\nᗚ IP • ๛ $(cat /etc/IP)\nᗚ Username • ๛ <code>$(awk -F " " '/Nome/ {print $2}' $CAD_ARQ)</code>\nᗚ Password • ๛ <code>$(awk -F " " '/Senha/ {print $2}' $CAD_ARQ)</code>\nᗚ Limit • $(awk -F " " '/Limite/ {print $2}' $CAD_ARQ)\nᗚ Expire • $(awk -F " " '/Validade/ {print $2}' $CAD_ARQ)\n\n࿂ SSH •  22\n࿂ SSL •  443\n࿂ Squid  •  8080\n࿂ Dropbear •  80\n[-] ═───────◇───────═\n࿂ Badvpn •  7300\n [-] ═───────◇───────═\n›☬[•] SCRIPTS ═◇ DANSSH ◇═ [•]☬" \
                            --parse_mode html
                    }
                    ;;
                'Enter the File Number:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Invalid option ❌ \n\n⚠️ Use only numbers [EX: 1]")" \
                            --parse_mode html
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text "<b>✅ CREADO EXITOSAMENTE ✅</b>\n\n♻️SSH Privada ♻️\n\n🔥⚡️⚡️ @drowkid01 🔰 ⚡️⚡️🔥\n======================\n=❌NO SPAM\n=❌NO DDOS\n=❌NO HACKING\n=❌NO CARDING\n=❌NO TORRENT\n=❌NO MULTILOGIN\n=======================\n\n\nᗚ IP • ๛ $(cat /etc/IP)\nᗚ Username • ๛ <code>$(awk -F " " '/Nome/ {print $2}' $CAD_ARQ)</code>\nᗚ Password • ๛ <code>$(awk -F " " '/Senha/ {print $2}' $CAD_ARQ)</code>\nᗚ Limit • $(awk -F " " '/Limite/ {print $2}' $CAD_ARQ)\nᗚ Expire • $(awk -F " " '/Validade/ {print $2}' $CAD_ARQ)\n\n࿂ SSH •  22\n࿂ SSL •  443\n࿂ Squid  •  8080\n࿂ Dropbear •  80\n[-] ═───────◇───────═\n࿂ Badvpn •  7300\n [-] ═───────◇───────═\n›☬[•] SCRIPTS ═◇ DANSSH ◇═ [•]☬" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    fun_download ${message_text[$id]} $CAD_ARQ
                    # Limpa o arquivo temporário.
                    >$CAD_ARQ
                    break
                    ;;
                '🗑 REMOVE USER 🗑\n\nUsername:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    fun_del_user ${message_text[$id]}
                    [[ "$_erro" == '1' ]] && break
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "✅ *Eliminada exitosamente.* 🚮" \
                        --parse_mode markdown
                    ;;
                '🔐 Change Password 🔐\n\nUsername:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    fun_verif_user ${message_text[$id]}
                    echo "$_erro"
                    [[ "$_erro" == '1' ]] && break
                    echo "${message_text[$id]}" >/tmp/name-s
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Nova senha:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'Nova senha:')
                    sizepass=$(echo -e ${#message_text[$id]})
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ "$sizepass" -lt '4' ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error !\n\n⚠️ Use minimum 4 characters [EX: 1234]")" \
                            --parse_mode html
                        break
                    }
                    alterar_senha_user $(cat /tmp/name-s) ${message_text[$id]}
                    [[ "$_erro" == '1' ]] && break
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "$(echo -e "=×=×=×=×=×=×=×=×=×=×=×\n<b>✅ CONTRASEÑA CAMBIADA !</b> !\n=×=×=×=×=×=×=×=×=×=×=×\n\n<b>User:</b> $(cat /tmp/name-s)\n<b>New Password:</b> ${message_text[$id]}")" \
                        --parse_mode html
                    rm /tmp/name-s >/dev/null 2>&1
                    ;;
                '👥 Change Threshold 👥\n\nUsername:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    echo $_erro segundo
                    fun_verif_user ${message_text[$id]}
                    echo "$_erro"
                    [[ "$_erro" == '1' ]] && break
                    echo "${message_text[$id]}" >/tmp/name-l
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Novo limite:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'Novo limite:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\n⚠️ Use only numbers [EX: 1]")" \
                            --parse_mode html
                        break
                    }
                    alterar_limite_user $(cat /tmp/name-l) ${message_text[$id]}
                    [[ "$_erro" == '1' ]] && break
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "$(echo -e "=×=×=×=×=×=×=×=×=×=×=×\n<b>✅ LÍMITE CAMBIADO !</b> !\n=×=×=×=×=×=×=×=×=×=×=×\n\n<b>User:</b> $(cat /tmp/name-l)\n<b>New Limit:</b> ${message_text[$id]}")" \
                        --parse_mode html
                    rm /tmp/name-l >/dev/null 2>&1
                    ;;
                '⏳ Change Date ⏳\n\nUsername:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    fun_verif_user ${message_text[$id]}
                    [[ "$_erro" == '1' ]] && break
                    echo "${message_text[$id]}" >/tmp/name-d
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'informe os dias ou data:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'informe os dias ou data:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9/]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! follow the example\n\nDays format [EX: 30]\ndate format [EX: 30/12/2019]")" \
                            --parse_mode html
                        break
                    }
                    alterar_data_user $(cat /tmp/name-d) ${message_text[$id]}
                    [[ "$_erro" == '1' ]] && break
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "$(echo -e "=×=×=×=×=×=×=×=×=×=×=×\n<b>✅ FECHA CAMBIADA !</b> !\n=×=×=×=×=×=×=×=×=×=×=×\n\n<b>User:</b> $(cat /tmp/name-d)\n<b>New date:</b> $udata")" \
                        --parse_mode html
                    rm /tmp/name-d >/dev/null 2>&1
                    ;;
                '[1] - ADICIONAR ARQUIVO\n[2] - EXCLUIR ARQUIVO\n\nInforme a opcao [1-2]:')
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\n⚠️ Use only numbers [EX: 1 ou 2]")" \
                            --parse_mode html
                        break
                    }
                    if [[ "${message_text[$id]}" = '1' ]]; then
                        ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                            --text "📤 HOST FILES 📤\n\nSend me the file:" \
                            --reply_markup "$(ShellBot.ForceReply)"
                    elif [[ "${message_text[$id]}" = '2' ]]; then
                        [[ $(ls /etc/bot/arquivos | wc -l) != '0' ]] && {
                            msg_cli1="≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠\n"
                            msg_cli1+="🚀<b> HOSTED FILES </b>\n"
                            msg_cli1+="≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠\n\n"
                            for _file in $(ls /etc/bot/arquivos); do
                                i=$(($i + 1))
                                msg_cli1+="<b>[$i]</b> - $_file\n"
                            done
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "$msg_cli1")" \
                                --parse_mode html
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text "🗑Delete File\nEnter the File Number:" \
                                --reply_markup "$(ShellBot.ForceReply)"
                        } || {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "There are no files available")" \
                                --parse_mode html
                            break
                        }
                    else
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Invalid option")" \
                            --parse_mode html
                        break
                    fi
                    ;;
                '🗑Delete File\nEnter the File Number:')
                    [[ "${message_from_id[$id]}" != "$id_admin" ]] && break
                    Opc1=${message_text[$id]}
                    echo $Opc1
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error deleting file! \n\n⚠️ Use only numbers [EX: 1]")" \
                            --parse_mode html
                        break
                    } || {
                        echo "opcao $Opc1"
                        _DirArq=$(ls /etc/bot/arquivos)
                        i=0
                        unset _Pass
                        while read _Arq; do
                            i=$(expr $i + 1)
                            _oP=$i
                            [[ $i == [1-9] ]] && i=0$i && oP+=" 0$i"
                            echo -e "[$i] - $_Arq"
                            _Pass+="\n${_oP}:${_Arq}"
                        done <<<"${_DirArq}"
                        _file=$(echo -e "${_Pass}" | grep -E "\b$Opc1\b" | cut -d: -f2)
                        [[ -e /etc/bot/arquivos/$_file ]] && {
                            rm /etc/bot/arquivos/$_file
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text "✅ *eliminado con éxito* ✅" \
                                --parse_mode markdown
                            break
                        } || {
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text "$(echo -e "❌ Invalid option")"
                            break
                        }
                    }
                    ;;
                '📤 HOST FILES 📤\n\nSend me the file:')
                    if [[ "${update_id[$id]}" ]]; then
                        # Monitora o envio de arquivos
                        [[ ${message_document_file_id[$id]} ]] && file_id=${message_document_file_id[$id]} && download_file=1
                        # Verifica se o download está ativado.
                        [[ $download_file -eq 1 ]] && {
                            file_id=($file_id)
                            ShellBot.getFile --file_id "${file_id[0]}"
                            ShellBot.downloadFile --file_path ${return[file_path]} --dir "/tmp/file" && {
                                msg='*✅ Successfully hosted file.*\n\n'
                                msg+="*📤 Information*\n\n"
                                msg+="*Name*: ${message_document_file_name}\n"
                                msg+="*More information*: /etc/bot/arquivos"
                                ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                    --text "$(echo -e "$msg")" \
                                    --parse_mode markdown
                                mv /tmp/file/$(ls -1rt /tmp/file | tail -n1) /etc/bot/arquivos/${message_document_file_name}
                                break
                            }
                        } || {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ Error receiving file ❌")" \
                                --parse_mode markdown
                            break
                        }
                    fi
                    ;;
                'Deseja restaurar ? [sim | nao]')
                    Resp=${message_text[$id]}
                    [[ ${message_from_id[$id]} != ${id_admin} ]] && break
                    [[ $Resp != ?(+|-)+([a-z]) ]] && {
                        ShellBot.sendMessage --chat_id ${id_admin} \
                            --text "$(echo -e "❌ Error ! \n\n⚠️ Use only yes or no")" \
                            --parse_mode html
                        break
                    }
                    [[ "$Resp" = @(Sim|sim|SIM) ]] && {
                        filebkp=$(ls /tmp | grep '.vps')
                        [[ -e /tmp/$filebkp ]] && {
                            mv /tmp/$filebkp /backup.vps
                            cd /
                            tar -xvf backup.vps
                            rm /backup.vps
                            ShellBot.sendMessage --chat_id ${id_admin} \
                                --text "$(echo -e "✅ Backup restored\nsuccessfully!")" \
                                --parse_mode html
                            break
                        }
                    }
                    break
                    ;;
                    # FUNCOES DE GESTAO REVENDA
                    #
                    # Adicionar, remover, limite, data, suspencao, relatorio
                    #
                '👥 ADD RESELLER 👥\n\nEnter the name:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    echo "Nome: ${message_text[$id]}" >$CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'Inform his user [Ex: @sibatrow]:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'Inform his user [Ex: @sibatrow]:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    _VAR1=$(echo -e ${message_text[$id]} | awk -F '@' {'print $2'})
                    [[ -z $_VAR1 ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error \n\n⚠️ Informar al usuario [EX: @drowkid01]")" \
                            --parse_mode html
                        break
                    }
                    [[ -d /etc/bot/revenda/$_VAR1 ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ El distribuidor ${message_text[$id]} already exists")" \
                            --parse_mode html
                        break
                    }
                    echo "User: ${message_text[$id]}" >>$CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'How many SSH can it create:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'How many SSH can it create:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\n⚠️ Use solo números [EX: 10]")" \
                            --parse_mode html
                        break
                    }
                    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
                        _limTotal=$(grep -w "${message_from_username}" $ativos | awk '{print $4}')
                        fun_verif_limite_rev ${message_from_username}
                        _limsomarev=$(echo "$_result + ${message_text[$id]}" | bc)
                        [[ "$_limsomarev" -gt "$_limTotal" ]] && {
                            _restant1=$(($_limTotal - $_result))
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ You don't have enough limit\n\nAvailable limit: $_restant1 ")" \
                                --parse_mode html
                            break
                        }
                    }
                    echo "Limite: ${message_text[$id]}" >>$CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text 'how many days of access:' \
                        --reply_markup "$(ShellBot.ForceReply)"
                    ;;
                'how many days of access:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    echo "Validade: ${message_text[$id]}" >>$CAD_ARQ
                    _clientrev=$(cat $CAD_ARQ)
                    criar_rev $CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "✅ Creado con éxito. ✅\n\n$(<$CAD_ARQ)\n\nBOT: @${message_reply_to_message_from_username}" \
                        --parse_mode html
                    ;;
                    # REMOVE REVENDEDOR
                '🗑 QUITAR DISTRIBUIDOR 🗑\n\nInform his user [Ex: @sibatrow]:')
                    echo -e "${message_text[$id]}" >$CAD_ARQ
                    _Var=$(sed -n '1 p' $CAD_ARQ | awk -F '@' {'print $2'})
                    [[ -z $_Var ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Usuario invalido")" \
                            --parse_mode html
                        break
                    }
                    del_rev $_Var
                    break
                    ;;
                    # ALTERAR LIMITE
                '♾ CHANGE RESALE LIMIT ♾\n\nInform his user [Ex: @sibatrow]:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    echo -e "Revendedor: ${message_text[$id]}" >$CAD_ARQ
                    _Var1=$(sed -n '1 p' $CAD_ARQ | awk -F '@' {'print $2'})
                    [[ -z $_Var1 ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Nombre inválido !")" \
                            --parse_mode html
                        break
                    }
                    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
                        [[ $(grep -wc $_Var1 $ativos) != '0' ]] && {
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text 'Enter the SSH Limit:' \
                                --reply_markup "$(ShellBot.ForceReply)"
                        } || {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ Revendedor ${message_text[$id]} nao existe")" \
                                --parse_mode html
                            break
                        }
                    }
                    [[ $(grep -w ${message_from_username} $ativos | awk '{print $NF}') == 'revenda' ]] && {
                        [[ "$(grep -wc "$_Var1" /etc/bot/revenda/${message_from_username}/${message_from_username})" != '0' ]] && {
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text 'Enter the SSH Limit:' \
                                --reply_markup "$(ShellBot.ForceReply)"
                        } || {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ Sub-reseller no existe")" \
                                --parse_mode html
                            break
                        }
                    }
                    ;;
                'Enter the SSH Limit:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\nUse only numbers [EX: 1]")" \
                            --parse_mode html
                        break
                    }
                    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
                        _limTotal=$(grep -w "${message_from_username}" $ativos | awk '{print $4}')
                        fun_verif_limite_rev ${message_from_username}
                        _limsomarev=$(echo "$_result + ${message_text[$id]}" | bc)

                        [[ $(grep -wc 'SUBREVENDA' /etc/bot/revenda/${message_from_username}/${message_from_username}) != '0' ]] && {
                            _limsomarev2=$(echo "$(grep -w 'SUBREVENDA' /etc/bot/revenda/${message_from_username}/${message_from_username} | awk {'print $4'} | paste -s -d + | bc)" + "${message_text[$id]}" | bc)
                        } || {
                            _limsomarev2='0'
                        }
                        [[ "$_limsomarev2" -ge "$_limTotal" ]] && {
                            echo $_limsomarev2
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ No tienes suficiente límite")" \
                                --parse_mode html
                            break
                        }
                        [[ "$_limsomarev" -gt "$_limTotal" ]] && {
                            [[ "$_limTotal" == "$(($_limTotal - $_result))" ]] && _restant1='0' || _restant1=$(($_limTotal - $_result))
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ No tienes suficiente límite\n\nRemaining limit: $_restant1 ")" \
                                --parse_mode html
                            break
                        }
                    }
                    echo -e "Limite: ${message_text[$id]}" >>$CAD_ARQ
                    lim_rev $CAD_ARQ
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "$(echo -e "=×=×=×=×=×=×=×=×=×=×=×\n<b>✅ LÍMITE DE REVENTA CAMBIADO !</b> !\n=×=×=×=×=×=×=×=×=×=×=×\n\n$(<$CAD_ARQ)")" \
                        --parse_mode html
                    # ALTERAR DATA
                    ;;
                '📆 CHANGE RESALE DATE 📆\n\nInform his user [Ex: @sibatrow]:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    _VAR1=$(echo -e ${message_text[$id]} | awk -F '@' {'print $2'})
                    [[ -z $_VAR1 ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "Revendedor ${message_text[$id]} nao existe")" \
                            --parse_mode html
                        break
                    }
                    [[ "${message_from_id[$id]}" == "$id_admin" ]] && {
                        [[ $(grep -wc $_VAR1 $ativos) != '0' ]] && {
                            echo -e "Revendedor: ${message_text[$id]}" >$CAD_ARQ
                            ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                --text 'Dias de acesso [Ex: 30]:' \
                                --reply_markup "$(ShellBot.ForceReply)"
                        } || {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ The Dealer ${message_text[$id]} does not exist")" \
                                --parse_mode html
                            break
                        }
                    } || {
                        [[ $(grep -w ${message_from_username} $ativos | awk '{print $NF}') == 'revenda' ]] && {
                            [[ "$(grep -wc "$_VAR1" /etc/bot/revenda/${message_from_username}/${message_from_username})" != '0' ]] && {
                                echo -e "Revendedor: ${message_text[$id]}" >$CAD_ARQ
                                ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                                    --text 'Dias de acesso [Ex: 30]:' \
                                    --reply_markup "$(ShellBot.ForceReply)"
                            } || {
                                ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                    --text "$(echo -e "❌  The Dealer ${message_text[$id]} does not exist")" \
                                    --parse_mode html
                                break
                            }
                        }
                    }
                    ;;
                'Dias de acesso [Ex: 30]:')
                    verifica_acesso
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\nUse only numbers [EX: 30]")" \
                            --parse_mode html
                        break
                    }
                    echo -e "Data: ${message_text[$id]}" >>$CAD_ARQ
                    dat_rev $CAD_ARQ
                    [[ "$_erro" == '1' ]] && break
                    ShellBot.sendMessage --chat_id ${message_from_id[$id]} \
                        --text "$(echo -e "=×=×=×=×=×=×=×=×=×=×=×\n<b>✅ FECHA DE REVENTA CAMBIADA !</b> !\n=×=×=×=×=×=×=×=×=×=×=×\n\n$(<$CAD_ARQ)")" \
                        --parse_mode html
                    ;;
                    # SUSPENDER REVENDEDOR
                '🔒 SUSPEND RESELLER 🔒\n\nInform his user [Ex: @sibatrow]:')
                    _VAR1=$(echo -e ${message_text[$id]} | awk -F '@' {'print $2'})
                    [[ -z $_VAR1 ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Dealer ${message_text[$id]} does not exist")" \
                            --parse_mode html
                        break
                    }
                    susp_rev $_VAR1
                    break
                    ;;
                '👤 CREATE TEST 👤\n\nHow many hours should EX last: 1:')
                    verifica_acesso
                    echo $_erro
                    [[ "$_erro" == '1' ]] && break
                    [[ ${message_text[$id]} != ?(+|-)+([0-9]) ]] && {
                        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                            --text "$(echo -e "❌ Error ! \n\nUse only numbers [EX: 1]")" \
                            --parse_mode html
                        >$CAD_ARQ
                        break
                    }
                    [[ "${message_from_id[$id]}" != "$id_admin" ]] && {
                        _limTotal=$(grep -w "${message_from_username}" $ativos | awk '{print $4}')
                        fun_verif_limite_rev ${message_from_username}
                        _limsomarev2=$(echo "$_result + 1" | bc)
                        [[ "$_limsomarev2" -gt "$_limTotal" ]] && {
                            ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                --text "$(echo -e "❌ You don't have enough limit")" \
                                --parse_mode html
                            >$CAD_ARQ
                            break
                        }
                    }
                    fun_teste ${message_text[$id]}
                    ;;
                esac
            fi
        ) &
    done
done
#FIM

