from django.shortcuts import render
from haystack.nodes import FARMReader
from django.http import HttpResponse , JsonResponse
import pathlib
from rest_framework.views import APIView
from django.views.decorators.csrf import csrf_exempt
temp = pathlib.PosixPath
pathlib.PosixPath = pathlib.WindowsPath
import json

new_reader = FARMReader(model_name_or_path="Reader")

class View(APIView):
    def post(self , request):
        question = request.data["question"]
        doc = request.data["doc"]
        dict = new_reader.predict_on_texts(question,[doc])['answers']
        dict2 = {}
        for num ,i in enumerate(dict) :
            dict2["answer"+str(num)] = i.answer 
            dict2["score"+str(num)] =  str(round(i.score*100,2))
        print(dict2)
        return JsonResponse(dict2 , safe=False , status = 200)
    



