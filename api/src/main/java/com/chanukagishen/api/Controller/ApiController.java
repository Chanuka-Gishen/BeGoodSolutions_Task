package com.chanukagishen.api.Controller;

import java.util.List;

import javax.validation.Valid;

import com.chanukagishen.api.Model.RegistrationModel;
import com.chanukagishen.api.Repository.RegistrationRepository;
//import com.chanukagishen.api.Service.ServiceClass;
import com.chanukagishen.api.exception.ResourceNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class ApiController {

    @Autowired
    RegistrationRepository noteRepository;

    @GetMapping("get_notes/")
    public List<RegistrationModel> getAllNotes() {
        return noteRepository.findAll();
    }

    @PostMapping("notes/")
    public RegistrationModel createNote(@Valid @RequestBody RegistrationModel note) {
        return noteRepository.save(note);
    }

    @GetMapping("notes/{id}")
    public RegistrationModel getNoteById(@PathVariable(value = "id") Long noteId) {
        return noteRepository.findById(noteId).orElseThrow(() -> new ResourceNotFoundException("Note", "id", noteId));
    }

    @PutMapping("notes/{id}")
    public RegistrationModel updateNote(@PathVariable(value = "id") Long noteId,
            @Valid @RequestBody RegistrationModel noteDetails) {

        RegistrationModel note = noteRepository.findById(noteId)
                .orElseThrow(() -> new ResourceNotFoundException("Note", "id", noteId));

        note.setTitle(noteDetails.getTitle());
        note.setContent(noteDetails.getContent());

        RegistrationModel updatedNote = noteRepository.save(note);
        return updatedNote;
    }

    @DeleteMapping("notes/{id}")
    public ResponseEntity<?> deleteNote(@PathVariable(value = "id") Long noteId) {
        RegistrationModel note = noteRepository.findById(noteId)
                .orElseThrow(() -> new ResourceNotFoundException("Note", "id", noteId));

        noteRepository.delete(note);

        return ResponseEntity.ok().build();
    }
}
