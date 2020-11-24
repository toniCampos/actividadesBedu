### RETO 2 SESIÓN 4 ###

    # 01
    filter={
        'name': {
            '$eq': 'Greg Powell'
        }
    }

    # 02
    filter={
        'name': {
            '$in': [
                'Greg Powell', 'Mercedes Tyler'
            ]
        }
    }

    # 03
    filter={}
    sort=list({
        'num_mflix_comments': -1
    }.items())
    limit=1

    # 04
    filter={}
    project={
        'title': 1, 
        '_id': 0
    }
    sort=list({
        'num_mflix_comments': -1
    }.items())
    limit=5
