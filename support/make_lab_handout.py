#!/usr/bin/env python

import os.path
import json
import subprocess
import shutil
import errno
import codecs
import sys
import re
from tempfile import mkdtemp

BITBUCKET_BASE_DIR = "https://bitbucket.org/hwuligans/gputeachingkit-labs/src/master/"

def create_mp_handout(out_file, mp_dir):
    base_path = mp_dir

    mp_relative_dir = re.sub(".*/(Module.*)", r'\1', mp_dir)
    module_number_str = re.sub(".*Module(\d+)/.*", r'\1', mp_dir)

    config_file_name = os.path.join(base_path, "config.json")
    description_file_name = os.path.join(base_path, "description.markdown")
    questions_file_name = os.path.join(base_path, "questions.json")
    answers_file_name = os.path.join(base_path, "answers.json")
    code_template_file_name = os.path.join(base_path, "template.cu")
    code_solution_file_name = os.path.join(base_path, "solution.cu")

    if not os.path.isfile(code_template_file_name):
        code_template_file_name = os.path.join(base_path, "template.cpp")

    if not os.path.isfile(code_solution_file_name):
        code_solution_file_name = os.path.join(base_path, "solution.cpp")

    with codecs.open(config_file_name, "r", "utf-8") as config_file:
        config = config_file.read()

    with codecs.open(description_file_name, "r", "utf-8") as description_file:
        description = description_file.read()

    with codecs.open(questions_file_name, "r", "utf-8") as questions_file:
        questions = questions_file.read()

    with codecs.open(answers_file_name, "r", "utf-8") as answers_file:
        answers = answers_file.read()

    with codecs.open(code_template_file_name, "r", "utf-8") as code_template_file:
        code_template = code_template_file.read()

    if os.path.isfile(code_solution_file_name):
        with codecs.open(code_solution_file_name, "r", "utf-8") as code_solution_file:
            code_solution = code_solution_file.read()
    else:
        code_solution = ""


    # load the data as json
    config_json = json.loads(config)
    try:
        questions_json = json.loads(questions)
    except Exception as e:
        print("Cannot parse questions ", e)
        questions_json = {"questions":[]}

    try:
        answers_json = json.loads(answers)
    except Exception as e:
        print("Cannot parse answers ", e)
        answers_json = {"answers":[]}

    # We modify all occurences of MP with lab
    description_markdown = description
    description_markdown = description_markdown.replace(
                                "title: ",
                                "title: Module " + module_number_str + " Lab - ",
                                1
    )
    description_markdown = description_markdown.replace(
        "LINKTOLAB",
        BITBUCKET_BASE_DIR + mp_relative_dir,
        1
    )
    description_markdown = description_markdown.replace(
        "LINKTOREADME",
        BITBUCKET_BASE_DIR + "README.md",
        1
    )
    description_markdown = description_markdown.replace("MP", "Lab", 1)

    # Create the question markdown format

    questions_markdown = "#Questions\n"
    for question, answer in zip(questions_json["questions"], answers_json["answers"]):
        questions_markdown = questions_markdown + "\n\n" + \
                             "(@) " + question + "\n\n" + \
                             "ANSWER: **" + answer + "**\n"

    if code_solution == "":
        code_solution_markdown = ""
    else:
        code_solution_markdown = "\n".join([
            "# Solution\n",
            "The following is a possible implementation of the lab. \n" +
            "This solution is intended for use only by the teaching staff \n" +
            "and should not be distributed to students.",
            "```{.cpp}",
            code_solution,
            "```"
        ])

    code_template_markdown = "\n".join([
        "# Code Template\n",
        "You are suggested to use the following code " +
        "as a starting point when developing the lab " +
        "the code below handles the import and export as well " +
        "as the checking of the solution. " +
        "The tutorial page describes the functionality of the `wb*` methods.\n"
        "```{.cpp}",
        code_template,
        "```"
    ])

    handout = "\n\n".join([
        description_markdown,
        questions_markdown,
        code_template_markdown,
        code_solution_markdown
    ])
    with codecs.open(out_file, "w", "utf-8") as target:
        target.write(handout)
    return out_file

def copy_dir(src, dst):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            try:
                shutil.copytree(s, d)
            except:
                continue
        else:
            shutil.copy2(s, d)

def compile_mp_description(mp_dir, support_dir, out_dir):
    print "Processing mp ", mp_dir
    temp_dir = mkdtemp()
    copy_dir(os.path.join(support_dir, "latex_template"), temp_dir)
    template_tex_file = os.path.join(temp_dir, "template.tex")
    structure_tex_file = os.path.join(temp_dir, "structure.tex")
    description_md_file = os.path.join(temp_dir, "description.md")
    description_tex_file = os.path.join(temp_dir, "description.tex")
    description_rtf_file = os.path.join(temp_dir, "description.rtf")
    description_docx_file = os.path.join(temp_dir, "description.docx")
    description_pdf_file = os.path.join(temp_dir, "description.pdf")

    target = create_mp_handout(description_md_file, mp_dir)
    subprocess.call(
        [
            "pandoc",
            "-s",
            "-N",
            "--template=" + template_tex_file,
            description_md_file,
            "-o",
            description_tex_file
        ],
        cwd=temp_dir
    )
    # we also want to insert the copy right information
    # for docx since it's not part of the template

    with codecs.open(description_md_file, "a+", "utf-8") as md:
        md.write("\n\n*  *  *  *\n\n") # a horizontal rule
        md.write("This work is licensed by UIUC and NVIDIA (2015) " + \
                 "under a Creative Commons Attribution-NonCommercial " +\
                 "4.0 License.")
    subprocess.call(
        [
            "pandoc",
            "-s",
            "-N",
            description_md_file,
            "-o",
            description_rtf_file
        ],
        cwd=temp_dir
    )
    subprocess.call(
        [
            "pandoc",
            "-s",
            "-N",
            description_md_file,
            "-o",
            description_docx_file
        ],
        cwd=temp_dir
    )
    subprocess.call(
        [
            "pdflatex",
            description_tex_file,
            "-o",
            description_pdf_file
        ],
        cwd=temp_dir
    )

    # we now need to get the name of the MP and move the pdf
    # file to there with the tile from the config
    config_file_name = os.path.join(mp_dir, "config.json")
    with open(config_file_name, "r") as config:
        config_json = json.load(config)
    title = config_json["name"]
    final_pdf_file = os.path.join(out_dir, title + ".pdf")
    shutil.copy2(description_pdf_file, final_pdf_file)
    final_rtf_file = os.path.join(out_dir, title + ".rtf")
    shutil.copy2(description_rtf_file, final_rtf_file)
    final_docx_file = os.path.join(out_dir, title + ".docx")
    shutil.copy2(description_docx_file, final_docx_file)

if __name__ == "__main__":
    mp_dir = sys.argv[1]
    support_dir = sys.argv[2]
    out_dir = sys.argv[3]
    compile_mp_description(mp_dir, support_dir, out_dir)
