### EJERCICIOS SESIÓN 4 ###
    # 01
    
    project={
        'name': 1, 
        'email_address': 1, 
        'phone_number': 1, 
        'external_links': 1, 
        'homepage_url': 1, 
        '_id': 0
    }

    # 02
    #wtf

    # 03
    filter={
        'founded_month': {
            '$eq': 10
        }
    }
    project={
        'name': 1
    }

    # 04
    filter={
        'founded_year': {
            '$eq': 2008
        }
    }
    project={
        'name': 1
    }

    # 05
    filter={
        'author': {
            '$eq': 'machine'
        }
    }

    # 06
    filter={
        'category_code': {
            '$eq': 'web'
        }
    }

    # 07
    filter={
        '$and': [
            {
                'founded_month': {
                    '$eq': 10
                }
            }, {
                'founded_year': {
                    '$eq': 2008
                }
            }
        ]
    }

    # 08
    # no encontré campo de empleados, supongo que era el de relaciones
    filter={
        'relationships': {
            '$size': 50
        }
    }
