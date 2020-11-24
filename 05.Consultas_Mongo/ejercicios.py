### Ejercicios ###

filter={
    'number_of_reviews': {
        '$gte': 50
    }, 
    'amenities': {
        '$in': [
            'Ethernet connection'
        ]
    }, 
    'address.country_code': 'BR', 
    'review_scores.review_scores_rating': {
        '$gte': 80
    }
}