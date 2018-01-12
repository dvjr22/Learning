from bottle import route, run, template

#http://localhost:8080/hello/Diego

@route('/hello/<name>')
def index(name):
    return template('<b>Hello {{name}}</b>!', name=name)

run(host='localhost', port=8080)



