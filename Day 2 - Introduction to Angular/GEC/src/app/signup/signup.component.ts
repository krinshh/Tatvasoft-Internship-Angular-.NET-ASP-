import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-signup',
  standalone: true,
  imports: [CommonModule, FormsModule], // <--- Add these
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent {
  email = '';
  password = '';
  confirmPassword = '';
  confirmPasswordTouched = false;

  constructor(private router: Router) {}

  get passwordsMatch(): boolean {
    return this.password === this.confirmPassword;
  }

  onSubmit() {
    this.confirmPasswordTouched = true;
    if (this.passwordsMatch && this.email && this.password) {
      alert(`Signing up with email: ${this.email}`);
      this.router.navigate(['/login']);
    }
  }
}
