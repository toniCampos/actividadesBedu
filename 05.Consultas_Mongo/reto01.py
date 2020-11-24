### RETO 1 SESIÓN 5 ###

    # 01
    filter={
        'house_rules': {
            '$regex': re.compile(r"no part[y|ies](?i)")
        }
    }
    project={
        'house_rules': 1
    }

    # 02
    filter={
        'house_rules': {
            '$regex': re.compile(r"no pet(?i)")
        }
    }
    project={
        'house_rules': 1
    }

    # 03
    filter={
        'house_rules': {
            '$regex': re.compile(r"no smok[ei](?i)")
        }
    }
    project={
        'house_rules': 1
    }

    # 04
    filter={
        'house_rules': {
            '$regex': re.compile(r"no smok[ei]|no part[i|y](?i)")
        }
    }
    project={
        'house_rules': 1
    }