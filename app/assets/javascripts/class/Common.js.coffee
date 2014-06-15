Ext.define 'MyClass.Common',
    singleton: true
    cookie_set:(name, value)->
        argv = arguments
        argc = arguments.length
        expires = if (argc > 2) then argv[2] else null
        path = if (argc > 3) then argv[3] else '/'
        domain = if (argc > 4) then argv[4] else null
        secure = if (argc > 5) then argv[5] else false
        document.cookie = name + "=" + escape(value) +
        ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
        ((path == null) ? "" : ("; path=" + path)) +
        ((domain == null) ? "" : ("; domain=" + domain)) +
        ((secure == true) ? "; secure" : "")
    cookie_get:(name)->
        arg = name + "="
        alen = arg.length
        clen = document.cookie.length;
        i = 0;
        j = 0;
        while (i < clen)
            j = i + alen
            if (document.cookie.substring(i, j) == arg)
                return this.cookie_getVal(j)
            i = document.cookie.indexOf(" ", i) + 1
            if (i == 0)
                break
        null
    cookie_getVal:(offset)->
        endstr = document.cookie.indexOf(";", offset)
        if (endstr == -1)
            endstr = document.cookie.length;
        unescape(document.cookie.substring(offset, endstr))
    cookie_clear:(name)->
        if cookie_get(name)
            document.cookie = name + "=" + "; expires=Thu, 01-Jan-70 00:00:01 GMT"