json.partial! 'common/response', response: @response

json.data do
  json.merge! JSON.parse(yield)
end