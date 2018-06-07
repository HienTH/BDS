from django import forms
class ProfileImageForm(forms.Form):
    avatar = forms.FileField(label='avatar')